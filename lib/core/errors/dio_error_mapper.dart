import 'package:dio/dio.dart';

import 'app_exception.dart';

//Mengubah DioException menjadi AppException.
//Tujuannya agar layer di atas (Repository, UseCase, Bloc, UI), tidak bergantung langsung pada Dio.
AppException mapDioError(DioException e) {
  switch (e.type) {
    //Koneksi timeout atau server terlalu lama merespon
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return const TimeoutException();

    //Tidak ada koneksi internet atau gagal terhubung ke server
    case DioExceptionType.connectionError:
      return const NetworkException();

    //Request berhasil dikirim tetapi server mengembalikan error response
    case DioExceptionType.badResponse:
      final statusCode = e.response?.statusCode;

      switch (statusCode) {
        case 400:
          return ServerException(
            e.response?.data['message'] ?? 'Bad request',
          );

        case 401:
          return const UnauthorizedException();

        case 404:
          return NotFoundException(
            e.response?.data['message'] ?? 'Data not found',
          );

        case 500:
          return const ServerException();

        default:
          return ServerException(
            e.response?.data['message'] ?? 'Server error',
          );
      }

    //Fallback untuk error Dio yang tidak tercover
    default:
      return const UnknownException();
  }
}

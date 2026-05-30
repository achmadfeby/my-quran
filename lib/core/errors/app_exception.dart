//Base exception untuk seluruh error aplikasi.
//Digunakan agar setiap layer memiliki format error yang konsisten.
abstract class AppException implements Exception {
  final String message;
  final Object? error;
  final StackTrace? stackTrace;

  const AppException(
    this.message, {
    this.error,
    this.stackTrace,
  });

  @override
  String toString() => message;
}

//Tidak ada koneksi internet
class NetworkException extends AppException {
  const NetworkException() : super('No internet connection');
}

//Request melebihi batas waktu
class TimeoutException extends AppException {
  const TimeoutException() : super('Request timeout');
}

//Error dari server
class ServerException extends AppException {
  const ServerException([super.message = 'Server error']);
}

//User tidak memiliki otoritas
class UnauthorizedException extends AppException {
  const UnauthorizedException() : super('Unauthorized');
}

//Resource yang tidak ditemuin
class NotFoundException extends AppException {
  const NotFoundException([super.message = 'Data not found']);
}

//Error yang tak terduga
class UnexpectedException extends AppException {
  const UnexpectedException(
    super.message, {
    super.error,
    super.stackTrace,
  });
}

//Untuk error yang gabisa dikategorikan
class UnknownException extends AppException {
  const UnknownException() : super('Something went wrong');
}

import 'package:dio/dio.dart';
import 'package:my_quran/core/errors/app_exception.dart';
import 'package:my_quran/core/errors/dio_error_mapper.dart';
import 'package:my_quran/feature/quran/data/models/surah.dart';
import 'package:my_quran/feature/quran/data/models/surah_detail_model.dart';

// Remote datasource bertanggung jawab untuk komunikasi ke API Quran
// Layer ini tidak boleh mengandung logic business, hanya data fetching
class QuranRemoteDatasource {
  final Dio dio;

  QuranRemoteDatasource(this.dio);

  Future<List<SurahModel>> getSurahs() async {
    try {
      // Hit endpoint surah dari AlQuran Cloud API
      final response = await dio.get('/surah');

      //Response data dibuat variable agar mudah di check
      final responseData = response.data;

      //Kalau responsenya null error trhow unkown exception
      if (responseData == null) {
        throw const UnknownException();
      }

      //Check response data map atau bukan kalau bukan  lempar error ke layer atas supaya bloc/repository bisa handle
      if (responseData is! Map<String, dynamic>) {
        throw const UnexpectedException('Invalid response format');
      }

      final data = responseData['data'];

      if (data is! List) {
        throw const UnexpectedException('Invalid surah list format');
      }

      // Mapping JSON ke model domain
      return data
          .map((e) => SurahModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      //Lempar error yang udah di mapping dio error kalau errornya dio ke layer atas supaya bloc/repository bisa handle
      if (e is DioException) throw mapDioError(e);
      throw const UnknownException();
    }
  }

  Future<SurahDetailModel> getSurahDetail(int number) async {
    try {
      final response = await dio.get(
        '/surah/$number/ar.alafasy',
      );

      final responseData = response.data['data'];

      if (responseData == null) {
        throw const UnknownException();
      }

      if (responseData is! Map<String, dynamic>) {
        throw const UnexpectedException('Invalid response format');
      }

      return SurahDetailModel.fromJson(
        responseData,
      );
    } catch (e) {
      if (e is DioException) throw mapDioError(e);
      throw const UnknownException();
    }
  }
}

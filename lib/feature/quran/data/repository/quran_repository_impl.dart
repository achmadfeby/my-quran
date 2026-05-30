import 'package:my_quran/feature/quran/data/datasource/quran_remote_datasource.dart';
import 'package:my_quran/feature/quran/domain/entities/ayah_entity.dart';
import 'package:my_quran/feature/quran/domain/entities/surah_detail_entity.dart';
import 'package:my_quran/feature/quran/domain/entities/surah_entity.dart';
import 'package:my_quran/feature/quran/domain/repository/quran_repository.dart';

// Implementasi dari quran repository
// Untuk Mengambil data dari datasource ,Mengubah Model (Data Layer) menjadi Entity (Domain Layer)
// dan Menyembunyikan sumber data dari layer di atasnya
// Dengan cara ini, UseCase dan Bloc tidak perlu tahu
// apakah data berasal dari API, database, atau cache.

class QuranRepositoryImpl implements QuranRepository {
  final QuranRemoteDatasource remoteDatasource;

  QuranRepositoryImpl(this.remoteDatasource);

  //Mengambil semua data surah dari API
  //Flownya= API -> SurahModel -> SurahEntity
  @override
  Future<List<SurahEntity>> getSurahs() async {
    final result = await remoteDatasource.getSurahs();

    return result.map(
      (e) {
        return SurahEntity(
          number: e.number,
          englishName: e.englishName,
          numberOfAyahs: e.numberOfAyahs,
          englishNameTranslation: e.englishNameTranslation,
        );
      },
    ).toList();
  }

  //Mengambil surah detail beserta ayatnya
  //Flownya = API-> SurahDetailModel -> SurahDetailEntity
  //Si ayat juga di konversi dari model ke entity
  @override
  Future<SurahDetailEntity> getSurahDetail(int number) async {
    final result = await remoteDatasource.getSurahDetail(number);

    return SurahDetailEntity(
      number: result.number,
      englishName: result.englishName,
      ayahs: result.ayahs.map((e) {
        return AyahEntity(
          numberInSurah: e.numberInSurah,
          text: e.text,
          audio: e.audio,
        );
      }).toList(),
    );
  }
}

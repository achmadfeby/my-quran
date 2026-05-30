import 'package:my_quran/feature/quran/domain/entities/surah_detail_entity.dart';
import 'package:my_quran/feature/quran/domain/entities/surah_entity.dart';

abstract class QuranRepository {
  Future<List<SurahEntity>> getSurahs();

  Future<SurahDetailEntity> getSurahDetail(int number);
}

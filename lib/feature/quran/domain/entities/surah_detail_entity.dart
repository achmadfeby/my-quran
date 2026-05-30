import 'package:my_quran/feature/quran/domain/entities/ayah_entity.dart';

class SurahDetailEntity {
  final int number;
  final String englishName;
  final List<AyahEntity> ayahs;

  const SurahDetailEntity(
      {required this.number, required this.englishName, required this.ayahs});
}

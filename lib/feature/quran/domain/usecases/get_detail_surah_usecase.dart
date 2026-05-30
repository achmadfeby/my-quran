import 'package:my_quran/feature/quran/domain/entities/surah_detail_entity.dart';
import 'package:my_quran/feature/quran/domain/repository/quran_repository.dart';

class GetSurahDetailUsecase {
  final QuranRepository repository;

  GetSurahDetailUsecase(this.repository);

  Future<SurahDetailEntity> call(int number) {
    return repository.getSurahDetail(number);
  }
}

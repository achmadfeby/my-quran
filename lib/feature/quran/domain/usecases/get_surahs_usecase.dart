import 'package:my_quran/feature/quran/domain/entities/surah_entity.dart';
import 'package:my_quran/feature/quran/domain/repository/quran_repository.dart';

class GetSurahsUsecase {
  final QuranRepository repository;

  GetSurahsUsecase(this.repository);

  Future<List<SurahEntity>> call() {
    return repository.getSurahs();
  }
}

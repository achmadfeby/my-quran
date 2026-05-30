import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_quran/core/errors/app_exception.dart';
import 'package:my_quran/feature/quran/domain/usecases/get_surahs_usecase.dart';
import 'package:my_quran/feature/quran/persentation/bloc/surah/surah_event.dart';
import 'package:my_quran/feature/quran/persentation/bloc/surah/surah_state.dart';

// Bloc ini mengatur state list surah
// Flow:
// Event -> Usecase -> Repository -> Datasource -> API
class SurahBloc extends Bloc<SurahEvent, SurahState> {
  final GetSurahsUsecase getSurahsUsecase;

  SurahBloc(this.getSurahsUsecase) : super(SurahInitial()) {
    on<GetSurahsEvent>(_onGetSurahs);

    on<SearchSurahEvent>(
      _onSearchSurah,
    );
  }

  Future<void> _onGetSurahs(
    GetSurahsEvent event,
    Emitter<SurahState> emit,
  ) async {
    //Jadikan state loading
    emit(SurahLoading());

    try {
      // call domain layer (usecase), bukan langsung datasource
      final result = await getSurahsUsecase();

      // success state
      emit(
        SurahLoaded(
          result,
          filteredSurahs: result,
        ),
      );
    } catch (e) {
      // error state supaya UI bisa tampil retry button

      emit(SurahError(e is AppException ? e.message : 'Something went wrong'));
    }
  }

  void _onSearchSurah(
    SearchSurahEvent event,
    Emitter<SurahState> emit,
  ) {
    //biar querynya kecil semua
    final query = event.query.toLowerCase();

    final currentState = state;

    if (currentState is! SurahLoaded) return;

    final allSurahs = currentState.allSurahs;

    if (query.isEmpty) {
      emit(
        SurahLoaded(
          allSurahs,
          filteredSurahs: allSurahs,
        ),
      );
      return;
    }

    final filtered = allSurahs.where((surah) {
      return surah.englishName.toLowerCase().contains(query);
    }).toList();

    emit(
      SurahLoaded(
        allSurahs,
        filteredSurahs: filtered,
      ),
    );
  }
}

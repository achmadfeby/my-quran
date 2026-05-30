import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_quran/core/errors/app_exception.dart';
import 'package:my_quran/feature/quran/domain/usecases/get_detail_surah_usecase.dart';
import 'package:my_quran/feature/quran/persentation/bloc/surah_detail/surah_detail_event.dart';
import 'package:my_quran/feature/quran/persentation/bloc/surah_detail/surah_detail_state.dart';

//Untuk logic surahdetail
class SurahDetailBloc extends Bloc<SurahDetailEvent, SurahDetailState> {
  final GetSurahDetailUsecase getSurahDetailUsecase;

  SurahDetailBloc(this.getSurahDetailUsecase) : super(SurahDetailInitial()) {
    on<GetSurahDetailEvent>(_onGetDetail);
  }

  //Get detail surah
  Future<void> _onGetDetail(
    GetSurahDetailEvent event,
    Emitter<SurahDetailState> emit,
  ) async {
    //Jadikan state menjadi loading
    emit(SurahDetailLoading());

    try {
      //call domain layer(usecase)
      final result = await getSurahDetailUsecase(
        event.number,
      );
      //Jadikan state menjadi loaded beserta datanya
      emit(SurahDetailLoaded(result));
    } catch (e) {
      //Jadikan state error dan lempar errornya ke persentation layer
      emit(SurahDetailError(
          e is AppException ? e.message : 'Something went wrong'));
    }
  }
}

import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_quran/core/errors/app_exception.dart';
import 'package:my_quran/feature/quran/domain/entities/ayah_entity.dart';
import 'package:my_quran/feature/quran/domain/entities/surah_detail_entity.dart';
import 'package:my_quran/feature/quran/domain/usecases/get_detail_surah_usecase.dart';
import 'package:my_quran/feature/quran/persentation/bloc/surah_detail/surah_detail_bloc.dart';
import 'package:my_quran/feature/quran/persentation/bloc/surah_detail/surah_detail_event.dart';
import 'package:my_quran/feature/quran/persentation/bloc/surah_detail/surah_detail_state.dart';

class MockGetDetailSurahUseCase extends Mock implements GetSurahDetailUsecase {}

const surahDetail =
    SurahDetailEntity(number: 1, englishName: 'Al-Faatiha', ayahs: [
  AyahEntity(
      numberInSurah: 1,
      text: 'text',
      audio: 'https://cdn.islamic.network/quran/audio/128/ar.alafasy/1.mp3'),
]);

void main() {
  MockGetDetailSurahUseCase createMock() => MockGetDetailSurahUseCase();

  //Test get surah detail berhasil
  blocTest('emits [loading,loaded] when GetSurahDetailEvent success',
      build: () {
        final mock = createMock();

        when(() => mock(any())).thenAnswer((_) async => surahDetail);
        return SurahDetailBloc(mock);
      },
      act: (bloc) => bloc.add(const GetSurahDetailEvent(1)),
      expect: () => [
            SurahDetailLoading(),
            const SurahDetailLoaded(surahDetail),
          ]);

  //Test get surah detail gagal
  blocTest(
    'emits [loading,error] when GetSurahDetailEvent',
    build: () {
      final mock = createMock();

      when(() => mock(any())).thenThrow(
        const UnexpectedException('Failed to load data'),
      );
      return SurahDetailBloc(mock);
    },
    act: (bloc) => bloc.add(const GetSurahDetailEvent(0)),
    expect: () =>
        [SurahDetailLoading(), const SurahDetailError('Failed to load data')],
  );
}

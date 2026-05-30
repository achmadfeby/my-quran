import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_quran/core/errors/app_exception.dart';
import 'package:my_quran/feature/quran/domain/entities/surah_entity.dart';
import 'package:my_quran/feature/quran/domain/usecases/get_surahs_usecase.dart';
import 'package:my_quran/feature/quran/persentation/bloc/surah/surah_bloc.dart';
import 'package:my_quran/feature/quran/persentation/bloc/surah/surah_event.dart';
import 'package:my_quran/feature/quran/persentation/bloc/surah/surah_state.dart';

class MockGetSurahUsecase extends Mock implements GetSurahsUsecase {}

const tSurahList = [
  SurahEntity(
      englishName: 'Al-Fatihah',
      number: 1,
      numberOfAyahs: 7,
      englishNameTranslation: 'The opening'),
  SurahEntity(
      englishName: 'Al-Baqarah',
      number: 2,
      numberOfAyahs: 286,
      englishNameTranslation: 'The cow'),
];

void main() {
  MockGetSurahUsecase createMock() => MockGetSurahUsecase();

  //Test get surah berhasil
  blocTest<SurahBloc, SurahState>(
    'emits [Loading, Loaded] when GetSurahsEvent success',
    build: () {
      final mock = createMock();

      when(() => mock()).thenAnswer((_) async => tSurahList);
      return SurahBloc(mock);
    },
    act: (bloc) => bloc.add(GetSurahsEvent()),
    expect: () => [
      SurahLoading(),
      const SurahLoaded(tSurahList),
    ],
  );

  // Test error while get surah alias gagal
  blocTest<SurahBloc, SurahState>(
    'emits [Loading, Error] when GetSurahsEvent throws AppException',
    build: () {
      final mock = createMock();
      when(() => mock()).thenThrow(
        const UnexpectedException('Failed to load data'),
      );
      return SurahBloc(mock);
    },
    act: (bloc) => bloc.add(GetSurahsEvent()),
    expect: () => [
      SurahLoading(),
      const SurahError('Failed to load data'),
    ],
  );

  // Test search surah return result
  blocTest<SurahBloc, SurahState>(
    'filters surah list when SearchSurahEvent is called',
    build: () {
      final mock = createMock();
      when(() => mock()).thenAnswer((_) async => tSurahList);
      return SurahBloc(mock);
    },
    act: (bloc) async {
      bloc.add(GetSurahsEvent());
      await Future.delayed(const Duration(milliseconds: 10));

      bloc.add(const SearchSurahEvent('fatihah'));
    },
    wait: const Duration(milliseconds: 600),
    expect: () => [
      SurahLoading(),
      const SurahLoaded(tSurahList, filteredSurahs: tSurahList),
      SurahLoaded(tSurahList, filteredSurahs: [tSurahList.first]),
    ],
  );

  // Test search empty return all
  blocTest<SurahBloc, SurahState>(
    'filters surah list when SearchSurahEvent is called',
    build: () {
      final mock = createMock();
      when(() => mock()).thenAnswer((_) async => tSurahList);
      return SurahBloc(mock);
    },
    act: (bloc) async {
      bloc.add(GetSurahsEvent());
      await bloc.stream.firstWhere((state) => state is SurahLoaded);

      bloc.add(const SearchSurahEvent('fatihah'));
    },
    expect: () => [
      SurahLoading(),
      const SurahLoaded(
        tSurahList,
        filteredSurahs: tSurahList,
      ),
      SurahLoaded(
        tSurahList,
        filteredSurahs: [tSurahList.first],
      ),
    ],
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_quran/feature/quran/domain/usecases/get_detail_surah_usecase.dart';
import 'package:my_quran/feature/quran/persentation/bloc/surah_detail/surah_detail_bloc.dart';
import 'package:my_quran/feature/quran/persentation/bloc/surah_detail/surah_detail_event.dart';
import 'package:my_quran/feature/quran/persentation/bloc/surah_detail/surah_detail_state.dart';

import '../../bloc/surah/detail_surah_bloc_test.dart';

class MockUseCase extends Mock implements GetSurahDetailUsecase {}

void main() {
  late MockUseCase mock;

  setUp(() {
    mock = MockUseCase();
  });

  testWidgets('detail surah UI', (tester) async {
    when(() => mock(any())).thenAnswer((_) async {
      await Future.delayed(const Duration(milliseconds: 50));
      return surahDetail;
    });

    final bloc = SurahDetailBloc(mock);

    await tester.pumpWidget(MaterialApp(
      home: BlocProvider(
        create: (_) => bloc,
        child: BlocBuilder<SurahDetailBloc, SurahDetailState>(
            builder: (context, state) {
          if (state is SurahDetailLoaded) {
            return Scaffold(
              appBar: AppBar(
                title: Text(state.surahDetail.englishName),
              ),
              body: ListView.builder(
                itemCount: state.surahDetail.ayahs.length,
                itemBuilder: (context, i) =>
                    Text(state.surahDetail.ayahs[i].text),
              ),
            );
          }

          return const SizedBox();
        }),
      ),
    ));

    //Action blocnya
    bloc.add(const GetSurahDetailEvent(1));

    //Tunggu state loaded
    await tester.pumpAndSettle();

    //Check apakah data ketemu atau data ditampilkan
    expect(find.text('Al-Faatiha'), findsOneWidget);
    expect(find.text('text'), findsOneWidget);
  });
}

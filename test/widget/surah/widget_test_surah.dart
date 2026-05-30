import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_quran/feature/quran/persentation/bloc/surah/surah_bloc.dart';
import 'package:my_quran/feature/quran/persentation/bloc/surah/surah_event.dart';
import 'package:my_quran/feature/quran/persentation/bloc/surah/surah_state.dart';
import 'package:my_quran/feature/quran/domain/usecases/get_surahs_usecase.dart';

import '../../bloc/surah/surah_bloc_test.dart';

class MockUsecase extends Mock implements GetSurahsUsecase {}

void main() {
  late MockUsecase mock;

  setUp(() {
    mock = MockUsecase();
  });

  testWidgets('search updates UI list', (tester) async {
    when(() => mock()).thenAnswer(
      (_) async => tSurahList,
    );

    final bloc = SurahBloc(mock);

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider.value(
          value: bloc,
          child: Scaffold(
            body: Column(
              children: [
                TextField(
                  onChanged: (v) {
                    bloc.add(SearchSurahEvent(v));
                  },
                ),
                Expanded(
                  child: BlocBuilder<SurahBloc, SurahState>(
                    builder: (context, state) {
                      if (state is SurahLoading) {
                        return const CupertinoActivityIndicator();
                      }

                      if (state is SurahLoaded) {
                        final list = state.filteredSurahs;

                        return ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (_, i) => Text(list[i].englishName),
                        );
                      }

                      return const SizedBox();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    // Untuk trigger load
    bloc.add(GetSurahsEvent());
    await tester.pump();
    await tester.pump();

    // verify initial list/tanpa filter
    expect(find.text('Al-Fatihah'), findsOneWidget);
    expect(find.text('Al-Baqarah'), findsOneWidget);

    // search input
    await tester.enterText(find.byType(TextField), 'fatihah');
    await tester.pump(const Duration(milliseconds: 600));

    // verify hasil filtered
    expect(find.text('Al-Fatihah'), findsOneWidget);
    expect(find.text('Al-Baqarah'), findsNothing);
  });
}

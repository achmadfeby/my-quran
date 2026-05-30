import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_quran/feature/quran/persentation/bloc/surah/surah_bloc.dart';
import 'package:my_quran/feature/quran/persentation/bloc/surah/surah_event.dart';
import 'package:my_quran/feature/quran/persentation/bloc/surah/surah_state.dart';
import 'package:my_quran/feature/quran/persentation/widgets/surah_widget.dart';

class SurahPage extends StatefulWidget {
  const SurahPage({super.key});

  @override
  State<SurahPage> createState() => _SurahPageState();
}

class _SurahPageState extends State<SurahPage> {
  Timer? _debounce;

  void onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      context.read<SurahBloc>().add(SearchSurahEvent(value));
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Quran'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search), hintText: 'Search...'),
              onChanged: onSearchChanged,
            ),
          ),
          Expanded(
            child: BlocBuilder<SurahBloc, SurahState>(
              builder: (context, state) {
                if (state is SurahLoading) {
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                }

                if (state is SurahError) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(state.message),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          onPressed: () {
                            context.read<SurahBloc>().add(
                                  GetSurahsEvent(),
                                );
                          },
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  );
                }
                if (state is SurahLoaded) {
                  final list = state.filteredSurahs;

                  if (list.isEmpty) {
                    return const Center(child: Text('Surah is Empty'));
                  }

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RefreshIndicator(
                      onRefresh: () async {
                        final bloc = context.read<SurahBloc>();

                        bloc.add(GetSurahsEvent());

                        await bloc.stream.firstWhere(
                          (state) => state is! SurahLoading,
                        );
                      },
                      child: ListView.separated(
                          itemBuilder: (context, i) {
                            final surah = list[i];
                            return SurahWidget(surah: surah);
                          },
                          separatorBuilder: (context, i) => const SizedBox(
                                height: 10.0,
                              ),
                          itemCount: list.length),
                    ),
                  );
                }

                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_quran/feature/quran/persentation/bloc/audio/audio_bloc.dart';
import 'package:my_quran/feature/quran/persentation/bloc/audio/audio_event.dart';
import 'package:my_quran/feature/quran/persentation/bloc/surah_detail/surah_detail_bloc.dart';
import 'package:my_quran/feature/quran/persentation/bloc/surah_detail/surah_detail_event.dart';
import 'package:my_quran/feature/quran/persentation/bloc/surah_detail/surah_detail_state.dart';
import 'package:my_quran/feature/quran/persentation/widgets/ayah_widget.dart';

class DetailSurahPage extends StatelessWidget {
  const DetailSurahPage({super.key, required this.number});
  final int number;

  @override
  Widget build(BuildContext context) {
    context.read<SurahDetailBloc>().add(
          GetSurahDetailEvent(number),
        );

    return BlocBuilder<SurahDetailBloc, SurahDetailState>(
        builder: (context, state) {
      if (state is SurahDetailLoading) {
        return const Scaffold(
          body: Center(
            child: CupertinoActivityIndicator(),
          ),
        );
      }
      if (state is SurahDetailError) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(state.message),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    context.read<SurahDetailBloc>().add(
                          GetSurahDetailEvent(number),
                        );
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        );
      }

      if (state is SurahDetailLoaded) {
        return Scaffold(
          appBar: AppBar(
            title: Text(state.surahDetail.englishName),
            automaticallyImplyLeading: false,
            leading: IconButton(
                onPressed: () {
                  context.read<AudioBloc>().add(StopAudioEvent());
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                )),
          ),
          body: ListView.separated(
            separatorBuilder: (context, i) => const SizedBox(height: 10.0),
            itemCount: state.surahDetail.ayahs.length,
            itemBuilder: (context, i) {
              final ayah = state.surahDetail.ayahs[i];
              return AyahWidget(ayah: ayah);
            },
          ),
        );
      }
      return const SizedBox();
    });
  }
}

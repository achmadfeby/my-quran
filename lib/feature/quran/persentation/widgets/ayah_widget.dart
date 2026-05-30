import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_quran/feature/quran/domain/entities/ayah_entity.dart';
import 'package:my_quran/feature/quran/persentation/bloc/audio/audio_bloc.dart';
import 'package:my_quran/feature/quran/persentation/bloc/audio/audio_event.dart';
import 'package:my_quran/feature/quran/persentation/bloc/audio/audio_state.dart';

class AyahWidget extends StatelessWidget {
  const AyahWidget({super.key, required this.ayah});
  final AyahEntity ayah;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.green.withValues(alpha: 0.1),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        ayah.numberInSurah.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: BlocBuilder<AudioBloc, AudioState>(
                    builder: (context, state) {
                      final isThisAudio = (state is AudioPlaying &&
                              state.audioUrl == ayah.audio) ||
                          (state is AudioPaused &&
                              state.audioUrl == ayah.audio);

                      final isThisLoading =
                          state is AudioLoading && state.audioUrl == ayah.audio;

                      if (!isThisAudio && !isThisLoading) {
                        return IconButton(
                          icon: const Icon(
                            Icons.play_circle,
                            size: 28.0,
                          ),
                          onPressed: () {
                            context.read<AudioBloc>().add(
                                  PlayAudioEvent(ayah.audio),
                                );
                          },
                        );
                      }

                      if (isThisLoading) {
                        return const Padding(
                          padding: EdgeInsets.all(12),
                          child: SizedBox(
                            height: 20.0,
                            width: 20.0,
                            child: CupertinoActivityIndicator(),
                          ),
                        );
                      }

                      final position = state is AudioPlaying
                          ? state.position
                          : (state as AudioPaused).position;
                      final duration = state is AudioPlaying
                          ? state.duration
                          : (state as AudioPaused).duration;

                      final maxSeconds = duration.inSeconds <= 0
                          ? 1.0
                          : duration.inSeconds.toDouble();
                      final posSeconds = position.inSeconds
                          .clamp(0, maxSeconds.toInt())
                          .toDouble();

                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: Icon(
                              state is AudioPlaying
                                  ? Icons.pause_circle
                                  : Icons.play_circle,
                              size: 30.0,
                            ),
                            onPressed: () {
                              if (state is AudioPlaying) {
                                context
                                    .read<AudioBloc>()
                                    .add(PauseAudioEvent());
                              } else {
                                context
                                    .read<AudioBloc>()
                                    .add(ResumeAudioEvent());
                              }
                            },
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Slider(
                                  value: posSeconds,
                                  max: maxSeconds,
                                  onChanged: duration.inSeconds <= 0
                                      ? null
                                      : (v) {
                                          context.read<AudioBloc>().add(
                                                SeekAudioEvent(
                                                  Duration(
                                                    seconds: v.toInt(),
                                                  ),
                                                ),
                                              );
                                        },
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        position.toString().split('.').first,
                                        style: const TextStyle(fontSize: 11),
                                      ),
                                      Text(
                                        duration.inSeconds <= 0
                                            ? '--:--'
                                            : duration
                                                .toString()
                                                .split('.')
                                                .first,
                                        style: const TextStyle(fontSize: 11),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              ayah.text,
              textAlign: TextAlign.end,
              style: const TextStyle(fontSize: 30.0),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:async';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:my_quran/feature/quran/persentation/bloc/audio/audio_event.dart';
import 'package:my_quran/feature/quran/persentation/bloc/audio/audio_state.dart';

// AudioBloc bertugas mengontrol playback audio ayat
// hanya boleh punya 1 audio aktif dalam 1 waktu
class AudioBloc extends Bloc<AudioEvent, AudioState> {
  final AudioPlayer player;

  AudioBloc(this.player) : super(AudioIdle()) {
    on<PlayAudioEvent>(_onPlay, transformer: restartable());
    on<PauseAudioEvent>(_onPause);
    on<ResumeAudioEvent>(_onResume);
    on<SeekAudioEvent>(_onSeek);
    on<StopAudioEvent>(_onStop);
  }

  // Stream polling ringan untuk update UI (progress slider)
  Stream<AudioState> _mergedStream(String url) async* {
    await for (final _ in Stream.periodic(const Duration(milliseconds: 200))) {
      final pos = player.position;
      final dur = player.duration ?? Duration.zero;
      final processingState = player.processingState;
      final playing = player.playing;

      // Kalo audio selesai reset ke awal & pause
      if (processingState == ProcessingState.completed) {
        await player.seek(Duration.zero);
        await player.pause();
        yield AudioPaused(
          audioUrl: url,
          position: Duration.zero,
          duration: dur,
        );
        continue;
      }

      //Kalau ini bukan audio aktif, skip update
      final currentState = state;
      if (currentState is AudioPaused && currentState.audioUrl == url) {
        yield AudioPaused(
          audioUrl: url,
          position: pos,
          duration: dur,
        );
        continue;
      }

      // Update state playing
      if (playing) {
        yield AudioPlaying(
          audioUrl: url,
          position: pos,
          duration: dur,
        );
      }
    }
  }

  Future<void> _onPlay(
    PlayAudioEvent event,
    Emitter<AudioState> emit,
  ) async {
    try {
      emit(AudioLoading(event.url));

      await player.stop();
      await player.setUrl(event.url);

      player.play();

      // tunggu duration valid
      final duration = await player.durationStream
          .firstWhere((d) => d != null && d.inSeconds > 0)
          .timeout(
            const Duration(seconds: 10),
            onTimeout: () => Duration.zero,
          );

      emit(AudioPlaying(
        audioUrl: event.url,
        position: Duration.zero,
        duration: duration ?? Duration.zero,
      ));

      // stream update posisi
      await emit.forEach(
        _mergedStream(event.url),
        onData: (AudioState newState) => newState,
        onError: (e, st) {
          debugPrint('STREAM ERROR: $e');
          return AudioIdle();
        },
      );
    } catch (e, st) {
      debugPrint('BLOC ERROR: $e');
      debugPrint('BLOC STACK: $st');
      emit(AudioIdle());
    }
  }

  //Pause audio
  Future<void> _onPause(
    PauseAudioEvent event,
    Emitter<AudioState> emit,
  ) async {
    await player.pause();

    final s = state;
    if (s is AudioPlaying) {
      emit(AudioPaused(
        audioUrl: s.audioUrl,
        position: s.position,
        duration: s.duration,
      ));
    }
  }

  //Resume audio
  Future<void> _onResume(
    ResumeAudioEvent event,
    Emitter<AudioState> emit,
  ) async {
    final s = state;
    if (s is! AudioPaused) return;

    player.play();

    emit(AudioPlaying(
      audioUrl: s.audioUrl,
      position: s.position,
      duration: s.duration,
    ));
  }

  // Seek audio slider drag
  Future<void> _onSeek(
    SeekAudioEvent event,
    Emitter<AudioState> emit,
  ) async {
    await player.seek(event.position);

    final s = state;
    if (s is AudioPlaying) {
      emit(AudioPlaying(
        audioUrl: s.audioUrl,
        position: event.position,
        duration: s.duration,
      ));
    } else if (s is AudioPaused) {
      emit(AudioPaused(
        audioUrl: s.audioUrl,
        position: event.position,
        duration: s.duration,
      ));
    }
  }

  //Stop audio
  Future<void> _onStop(
    StopAudioEvent event,
    Emitter<AudioState> emit,
  ) async {
    await player.stop();
    emit(AudioIdle());
  }

  //Cleanup semua biar gak memory leak
  @override
  Future<void> close() async {
    await player.stop();
    await player.dispose();
    return super.close();
  }
}

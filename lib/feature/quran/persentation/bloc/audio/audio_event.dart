import 'package:equatable/equatable.dart';

//Untuk semua aksi yang bisa dilakukan oleh audio
abstract class AudioEvent extends Equatable {
  const AudioEvent();

  @override
  List<Object?> get props => [];
}

class PlayAudioEvent extends AudioEvent {
  final String url;
  const PlayAudioEvent(this.url);

  @override
  List<Object?> get props => [url];
}

class PauseAudioEvent extends AudioEvent {}

class ResumeAudioEvent extends AudioEvent {}

class SeekAudioEvent extends AudioEvent {
  final Duration position;
  const SeekAudioEvent(this.position);

  @override
  List<Object?> get props => [position];
}

class StopAudioEvent extends AudioEvent {}

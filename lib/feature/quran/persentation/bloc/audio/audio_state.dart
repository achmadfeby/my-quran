import 'package:equatable/equatable.dart';

//Semua state di audio diatur di class ini
abstract class AudioState extends Equatable {
  const AudioState();

  @override
  List<Object?> get props => [];
}

class AudioIdle extends AudioState {}

class AudioLoading extends AudioState {
  final String audioUrl;
  const AudioLoading(this.audioUrl);

  @override
  List<Object?> get props => [audioUrl];
}

class AudioPlaying extends AudioState {
  final String audioUrl;
  final Duration position;
  final Duration duration;

  const AudioPlaying({
    required this.audioUrl,
    required this.position,
    required this.duration,
  });

  @override
  List<Object?> get props => [audioUrl, position, duration];
}

class AudioPaused extends AudioState {
  final String audioUrl;
  final Duration position;
  final Duration duration;

  const AudioPaused({
    required this.audioUrl,
    required this.position,
    required this.duration,
  });

  @override
  List<Object?> get props => [audioUrl, position, duration];
}

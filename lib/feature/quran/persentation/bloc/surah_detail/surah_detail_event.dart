import 'package:equatable/equatable.dart';

abstract class SurahDetailEvent extends Equatable {
  const SurahDetailEvent();

  @override
  List<Object?> get props => [];
}

class GetSurahDetailEvent extends SurahDetailEvent {
  final int number;

  const GetSurahDetailEvent(this.number);

  @override
  List<Object?> get props => [number];
}

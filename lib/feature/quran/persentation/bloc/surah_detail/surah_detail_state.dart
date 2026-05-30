import 'package:equatable/equatable.dart';
import 'package:my_quran/feature/quran/domain/entities/surah_detail_entity.dart';

//class ini untuk mengatur semua state surah detail
abstract class SurahDetailState extends Equatable {
  const SurahDetailState();

  @override
  List<Object?> get props => [];
}

class SurahDetailInitial extends SurahDetailState {}

class SurahDetailLoading extends SurahDetailState {}

class SurahDetailLoaded extends SurahDetailState {
  final SurahDetailEntity surahDetail;

  const SurahDetailLoaded(this.surahDetail);

  @override
  List<Object?> get props => [surahDetail];
}

class SurahDetailError extends SurahDetailState {
  final String message;

  const SurahDetailError(this.message);

  @override
  List<Object?> get props => [message];
}

import 'package:equatable/equatable.dart';
import 'package:my_quran/feature/quran/domain/entities/surah_entity.dart';

//State surah untuk mengatur semua state yang ada di surah
abstract class SurahState extends Equatable {
  const SurahState();

  @override
  List<Object?> get props => [];
}

class SurahInitial extends SurahState {}

class SurahLoading extends SurahState {}

class SurahLoaded extends SurahState {
  final List<SurahEntity> allSurahs;
  final List<SurahEntity> filteredSurahs;

  const SurahLoaded(
    this.allSurahs, {
    List<SurahEntity>? filteredSurahs,
  }) : filteredSurahs = filteredSurahs ?? allSurahs;

  @override
  List<Object?> get props => [allSurahs, filteredSurahs];
}

class SurahError extends SurahState {
  final String message;

  const SurahError(this.message);

  @override
  List<Object?> get props => [message];
}

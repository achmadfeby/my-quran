import 'package:equatable/equatable.dart';

//Semua action di surah diatur melalu class ini
abstract class SurahEvent extends Equatable {
  const SurahEvent();

  @override
  List<Object?> get props => [];
}

class GetSurahsEvent extends SurahEvent {}

class SearchSurahEvent extends SurahEvent {
  final String query;

  const SearchSurahEvent(this.query);

  @override
  List<Object?> get props => [query];
}

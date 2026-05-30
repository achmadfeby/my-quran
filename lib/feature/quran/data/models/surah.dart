import 'package:freezed_annotation/freezed_annotation.dart';
part 'surah.g.dart';
part 'surah.freezed.dart';

@freezed
abstract class SurahModel with _$SurahModel {
  const factory SurahModel({
    required int number,
    required String englishName,
    required int numberOfAyahs,
    required String englishNameTranslation,
  }) = _SurahModel;

  factory SurahModel.fromJson(Map<String, dynamic> json) =>
      _$SurahModelFromJson(json);
}

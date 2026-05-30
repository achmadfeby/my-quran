import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_quran/feature/quran/data/models/ayah_model.dart';
part 'surah_detail_model.g.dart';
part 'surah_detail_model.freezed.dart';

@freezed
abstract class SurahDetailModel with _$SurahDetailModel {
  const factory SurahDetailModel({
    required int number,
    required String englishName,
    required List<AyahModel> ayahs,
  }) = _SurahDetailModel;

  factory SurahDetailModel.fromJson(Map<String, dynamic> json) =>
      _$SurahDetailModelFromJson(json);
}

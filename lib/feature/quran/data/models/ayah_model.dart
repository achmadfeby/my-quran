import 'package:freezed_annotation/freezed_annotation.dart';
part 'ayah_model.g.dart';
part 'ayah_model.freezed.dart';

@freezed
abstract class AyahModel with _$AyahModel {
  const factory AyahModel({
    required int numberInSurah,
    required String text,
    required String audio,
  }) = _AyahModel;

  factory AyahModel.fromJson(Map<String, dynamic> json) =>
      _$AyahModelFromJson(json);
}

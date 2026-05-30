// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surah_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SurahDetailModel _$SurahDetailModelFromJson(Map<String, dynamic> json) =>
    _SurahDetailModel(
      number: (json['number'] as num).toInt(),
      englishName: json['englishName'] as String,
      ayahs: (json['ayahs'] as List<dynamic>)
          .map((e) => AyahModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SurahDetailModelToJson(_SurahDetailModel instance) =>
    <String, dynamic>{
      'number': instance.number,
      'englishName': instance.englishName,
      'ayahs': instance.ayahs,
    };

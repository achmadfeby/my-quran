// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surah.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SurahModel _$SurahModelFromJson(Map<String, dynamic> json) => _SurahModel(
      number: (json['number'] as num).toInt(),
      englishName: json['englishName'] as String,
      numberOfAyahs: (json['numberOfAyahs'] as num).toInt(),
      englishNameTranslation: json['englishNameTranslation'] as String,
    );

Map<String, dynamic> _$SurahModelToJson(_SurahModel instance) =>
    <String, dynamic>{
      'number': instance.number,
      'englishName': instance.englishName,
      'numberOfAyahs': instance.numberOfAyahs,
      'englishNameTranslation': instance.englishNameTranslation,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ayah_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AyahModel _$AyahModelFromJson(Map<String, dynamic> json) => _AyahModel(
      numberInSurah: (json['numberInSurah'] as num).toInt(),
      text: json['text'] as String,
      audio: json['audio'] as String,
    );

Map<String, dynamic> _$AyahModelToJson(_AyahModel instance) =>
    <String, dynamic>{
      'numberInSurah': instance.numberInSurah,
      'text': instance.text,
      'audio': instance.audio,
    };

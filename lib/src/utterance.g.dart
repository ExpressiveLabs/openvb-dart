// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'utterance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileDescriptor _$FileDescriptorFromJson(Map<String, dynamic> json) =>
    FileDescriptor(
      path: json['path'] as String,
      aliases:
          (json['aliases'] as List<dynamic>).map((e) => e as String).toList(),
      pitch: (json['pitch'] as num?)?.toInt(),
      analysisFiles: (json['analysis_files'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      language: json['language'] as String?,
      extras: json['extras'] as Map<String, dynamic>?,
      labels: (json['labels'] as List<dynamic>)
          .map((e) => Utterance.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FileDescriptorToJson(FileDescriptor instance) =>
    <String, dynamic>{
      'path': instance.path,
      'aliases': instance.aliases,
      if (instance.pitch case final value?) 'pitch': value,
      if (instance.analysisFiles case final value?) 'analysis_files': value,
      if (instance.language case final value?) 'language': value,
      if (instance.extras case final value?) 'extras': value,
      'labels': instance.labels,
    };

Utterance _$UtteranceFromJson(Map<String, dynamic> json) => Utterance(
      prev: json['prev'] as String,
      curr: json['curr'] as String,
      next: json['next'] as String,
      language: json['language'] as String?,
      pitch: (json['pitch'] as num?)?.toInt(),
      start: Timestamp.fromJson(json['start'] as Map<String, dynamic>),
      end: Timestamp.fromJson(json['end'] as Map<String, dynamic>),
      extras: json['extras'] as Map<String, dynamic>?,
      flags: (json['flags'] as num).toInt(),
      areas: (json['areas'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            _$recordConvert(
              e,
              ($jsonValue) => (
                Timestamp.fromJson($jsonValue[r'$1'] as Map<String, dynamic>),
                Timestamp.fromJson($jsonValue[r'$2'] as Map<String, dynamic>),
              ),
            )),
      ),
      minified: _$recordConvertNullable(
        json['minified'],
        ($jsonValue) => (
          ($jsonValue[r'$1'] as num).toInt(),
          ($jsonValue[r'$2'] as num).toInt(),
          ($jsonValue[r'$3'] as num).toInt(),
        ),
      ),
    );

Map<String, dynamic> _$UtteranceToJson(Utterance instance) => <String, dynamic>{
      'prev': instance.prev,
      'curr': instance.curr,
      'next': instance.next,
      if (instance.language case final value?) 'language': value,
      if (instance.pitch case final value?) 'pitch': value,
      'start': instance.start,
      'end': instance.end,
      if (instance.extras case final value?) 'extras': value,
      'flags': instance.flags,
      if (instance.areas?.map((k, e) => MapEntry(k, <String, dynamic>{
                r'$1': e.$1,
                r'$2': e.$2,
              }))
          case final value?)
        'areas': value,
      if (instance.minified == null
              ? null
              : <String, dynamic>{
                  r'$1': instance.minified!.$1,
                  r'$2': instance.minified!.$2,
                  r'$3': instance.minified!.$3,
                }
          case final value?)
        'minified': value,
    };

$Rec _$recordConvert<$Rec>(
  Object? value,
  $Rec Function(Map) convert,
) =>
    convert(value as Map<String, dynamic>);

$Rec? _$recordConvertNullable<$Rec>(
  Object? value,
  $Rec Function(Map) convert,
) =>
    value == null ? null : convert(value as Map<String, dynamic>);

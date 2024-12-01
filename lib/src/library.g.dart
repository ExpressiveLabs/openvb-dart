// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Library _$LibraryFromJson(Map<String, dynamic> json) => Library(
      name: json['name'] as String,
      uuid: json['uuid'] as String,
      basePath: json['base_path'] as String,
      language: json['language'] == null
          ? null
          : Language.fromJson(json['language'] as Map<String, dynamic>),
      isDefault: json['is_default'] as bool,
      files: (json['files'] as List<dynamic>)
          .map((e) => FileDescriptor.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..flagFields = (json['flag_fields'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..extraFields = (json['extra_fields'] as List<dynamic>?)
          ?.map((e) => _$recordConvert(
                e,
                ($jsonValue) => (
                  $jsonValue[r'$1'] as String,
                  $jsonValue[r'$2'] as String,
                ),
              ))
          .toList();

Map<String, dynamic> _$LibraryToJson(Library instance) => <String, dynamic>{
      'name': instance.name,
      'uuid': instance.uuid,
      'base_path': instance.basePath,
      if (instance.language case final value?) 'language': value,
      'is_default': instance.isDefault,
      'files': instance.files,
      if (instance.flagFields case final value?) 'flag_fields': value,
      if (instance.extraFields
              ?.map((e) => <String, dynamic>{
                    r'$1': e.$1,
                    r'$2': e.$2,
                  })
              .toList()
          case final value?)
        'extra_fields': value,
    };

$Rec _$recordConvert<$Rec>(
  Object? value,
  $Rec Function(Map) convert,
) =>
    convert(value as Map<String, dynamic>);

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
    );

Map<String, dynamic> _$LibraryToJson(Library instance) => <String, dynamic>{
      'name': instance.name,
      'uuid': instance.uuid,
      'base_path': instance.basePath,
      if (instance.language case final value?) 'language': value,
      'is_default': instance.isDefault,
      'files': instance.files,
    };
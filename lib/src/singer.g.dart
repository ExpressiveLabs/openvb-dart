// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'singer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Singer _$SingerFromJson(Map<String, dynamic> json) => Singer(
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
      origin: Origin.fromJson(json['origin'] as Map<String, dynamic>),
      language: Language.fromJson(json['language'] as Map<String, dynamic>),
      libraries: (json['libraries'] as List<dynamic>)
          .map((e) => Library.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SingerToJson(Singer instance) => <String, dynamic>{
      'meta': instance.meta,
      'origin': instance.origin,
      'language': instance.language,
      'libraries': instance.libraries,
    };

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      name: json['name'] as String,
      uuid: json['uuid'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'name': instance.name,
      'uuid': instance.uuid,
      'icon': instance.icon,
    };

Origin _$OriginFromJson(Map<String, dynamic> json) => Origin(
      author: json['author'] == null
          ? null
          : Author.fromJson(json['author'] as Map<String, dynamic>),
      developer: json['developer'] == null
          ? null
          : Author.fromJson(json['developer'] as Map<String, dynamic>),
      publisher: json['publisher'] == null
          ? null
          : Author.fromJson(json['publisher'] as Map<String, dynamic>),
      application: json['application'] as String,
      creationDate: json['creation_date'] as String,
    );

Map<String, dynamic> _$OriginToJson(Origin instance) => <String, dynamic>{
      if (instance.author case final value?) 'author': value,
      if (instance.developer case final value?) 'developer': value,
      if (instance.publisher case final value?) 'publisher': value,
      'application': instance.application,
      'creation_date': instance.creationDate,
    };

Author _$AuthorFromJson(Map<String, dynamic> json) => Author(
      name: json['name'] as String,
      email: json['email'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'url': instance.url,
    };

Language _$LanguageFromJson(Map<String, dynamic> json) => Language(
      defaultValue: json['default'] as String,
      supported:
          (json['supported'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$LanguageToJson(Language instance) => <String, dynamic>{
      'default': instance.defaultValue,
      'supported': instance.supported,
    };

import 'dart:convert';
import 'dart:io';

import 'package:json_annotation/json_annotation.dart';
import 'package:openvb/openvb.dart';
import 'package:openvb/src/ffi/main.dart';
import 'package:openvb/src/library.dart';

part 'singer.g.dart';

@JsonSerializable()
class Singer {
  Meta meta;
  Origin origin;
  Language language;

  List<Library> libraries;

  @JsonKey(includeIfNull: false, name: 'flag_fields')
  List<String>? flagFields;
  @JsonKey(includeIfNull: false, name: 'extra_fields')
  List<(String, String)>? extraFields;

  Singer({required this.meta, required this.origin, required this.language, required this.libraries});

  // JSON serialization
  factory Singer.fromJson(Map<String, dynamic> json) => _$SingerFromJson(json);
  Map<String, dynamic> toJson() => _$SingerToJson(this);


  // Implement functions
  factory Singer.fromFile(String path) {
    String? content;

    if(path.endsWith('.bin')) {
      // Read encoded OpenVB file (*.bin pattern)
      content = readEncoded(path: path);
    } else {
      // Read JSON file
      content = File(path).readAsStringSync();
    }
      
    if(content != null) {
      final json = jsonDecode(content);

      final meta = Meta.fromJson(json['meta']);
      final origin = Origin.fromJson(json['origin']);
      final language = Language.fromJson(json['language']);
      final libraries = (json['libraries'] as List).map((e) => Library.fromJson(e)).toList();

      return Singer(meta: meta, origin: origin, language: language, libraries: libraries);
    } else {
      throw FileSystemException('Cannot read file: $path');
    }
  }

  // Future<Singer> fromTextgrid(String path) async {
    
  // }

  Future<void> toFile(String path) async {
    final json = jsonEncode(this);
    File(path).writeAsStringSync(json);
  }

  Future<bool> toEncoded(String path, {bool encrypt=false}) {
    final json = jsonEncode(this);
    final result = writeEncoded(path: path, content: json);

    return Future.value(result);
  }

  // Getters
  List<Utterance> get utterances {
    List<Utterance> utterances = [];

    for(var library in libraries) {
      utterances.addAll(library.utterances);
    }

    return utterances;
  }
  List<FileDescriptor> get files {
    List<FileDescriptor> files = [];

    for(var library in libraries) {
      files.addAll(library.files);
    }

    return files;
  }
}

@JsonSerializable()
class Meta {
  String name;
  String uuid;
  String icon;

  Meta({required this.name, required this.uuid, required this.icon});

  // JSON serialization
  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
  Map<String, dynamic> toJson() => _$MetaToJson(this);
}

@JsonSerializable()
class Origin {
  @JsonKey(includeIfNull: false)
  Author? author;
  @JsonKey(includeIfNull: false)
  Author? developer;
  @JsonKey(includeIfNull: false)
  Author? publisher;

  String application;
  @JsonKey(name: 'creation_date')
  String creationDate;

  Origin({this.author, this.developer, this.publisher, required this.application, required this.creationDate});

  // JSON serialization
  factory Origin.fromJson(Map<String, dynamic> json) => _$OriginFromJson(json);
  Map<String, dynamic> toJson() => _$OriginToJson(this);
}

@JsonSerializable()
class Author {
  String name;
  String email;
  String url;

  Author({required this.name, required this.email, required this.url});

  // JSON serialization
  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);
  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}

@JsonSerializable()
class Language {
  @JsonKey(name: 'default')
  String defaultValue;
  List<String> supported;

  Language({required this.defaultValue, required this.supported});

  // JSON serialization
  factory Language.fromJson(Map<String, dynamic> json) => _$LanguageFromJson(json);
  Map<String, dynamic> toJson() => _$LanguageToJson(this);
}
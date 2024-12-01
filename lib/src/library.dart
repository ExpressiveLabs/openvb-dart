import 'package:json_annotation/json_annotation.dart';
import 'package:openvb/src/singer.dart';
import 'package:openvb/src/utterance.dart';

part 'library.g.dart';

@JsonSerializable()
class Library {
  String name;
  String uuid;

  @JsonKey(name: 'base_path')
  String basePath;
  @JsonKey(includeIfNull: false)
  Language? language;
  @JsonKey(name: 'is_default')
  bool isDefault;

  List<FileDescriptor> files;

  Library({required this.name, required this.uuid, required this.basePath, this.language, required this.isDefault, required this.files});

  // JSON serialization
  factory Library.fromJson(Map<String, dynamic> json) => _$LibraryFromJson(json);
  Map<String, dynamic> toJson() => _$LibraryToJson(this);


  // Implement getters
  List<Utterance> get utterances {
    List<Utterance> utterances = [];

    for(var file in files) {
      utterances.addAll(file.labels);
    }

    return utterances;
  }
}
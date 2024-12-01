import 'package:json_annotation/json_annotation.dart';
import 'package:openvb/src/time.dart';

part 'utterance.g.dart';

@JsonSerializable()
class FileDescriptor {
  String path;
  List<String> aliases;
  
  @JsonKey(includeIfNull: false)
  int? pitch;
  @JsonKey(name: 'analysis_files', includeIfNull: false)
  Map<String, String>? analysisFiles;
  @JsonKey(includeIfNull: false)
  String? language;
  @JsonKey(includeIfNull: false)
  Map<String, dynamic>? extras;

  List<Utterance> labels;

  FileDescriptor({required this.path, required this.aliases, this.pitch, this.analysisFiles, this.language, this.extras, required this.labels});
  
  // JSON serialization
  factory FileDescriptor.fromJson(Map<String, dynamic> json) {
    FileDescriptor data = _$FileDescriptorFromJson(json);
    for(var label in data.labels) {
      label.audioPath = data.path;
    }

    return data;
  }
  Map<String, dynamic> toJson() => _$FileDescriptorToJson(this);
}

@JsonSerializable()
class Utterance {
  String prev;
  String curr;
  String next;

  @JsonKey(includeFromJson: false, includeToJson: false)
  late String? audioPath;
  
  @JsonKey(includeIfNull: false)
  String? language;
  @JsonKey(includeIfNull: false)
  int? pitch;

  Timestamp start;
  Timestamp midpoint;
  Timestamp end;
  

  @JsonKey(includeIfNull: false)
  Map<String, dynamic>? extras;
  int flags;

  @JsonKey(includeIfNull: false)
  Map<String, (Timestamp, Timestamp)>? areas;
  @JsonKey(includeIfNull: false)
  (int, int, int)? minified;

  Utterance({required this.prev, required this.curr, required this.next, this.audioPath, this.language, this.pitch, required this.start, required this.end, required this.midpoint, this.extras, required this.flags, this.areas, this.minified});

  // JSON serialization
  factory Utterance.fromJson(Map<String, dynamic> json) => _$UtteranceFromJson(json);
  Map<String, dynamic> toJson() => _$UtteranceToJson(this);
}
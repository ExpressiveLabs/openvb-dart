import 'package:json_annotation/json_annotation.dart';

part 'time.g.dart';

@JsonSerializable()
class Timestamp {
  int value;

  Timestamp(this.value);

  // JSON serialization
  factory Timestamp.fromJson(Map<String, dynamic> json) => _$TimestampFromJson(json);
  Map<String, dynamic> toJson() => _$TimestampToJson(this);

  // Implement operators
  Timestamp operator +(Timestamp other) {
    return Timestamp(value + other.value);
  }
  Timestamp operator -(Timestamp other) {
    return Timestamp(value - other.value);
  }
  Timestamp operator *(int other) {
    return Timestamp(value * other);
  }
  Timestamp operator /(int other) {
    return Timestamp(value ~/ other);
  }

  Timestamp operator ~/(int other) {
    return Timestamp(value ~/ other);
  }
  Timestamp operator %(int other) {
    return Timestamp(value % other);
  }
  Timestamp operator -() {
    return Timestamp(-value);
  }

  // Implement comparison methods
  bool operator ==(Object other) {
    if (other is Timestamp) {
      return value == other.value;
    }
    return false;
  }

  int get hashCode => value.hashCode;

  int compareTo(Timestamp other) {
    return value.compareTo(other.value);
  }

  bool isBefore(Timestamp other) {
    return value < other.value;
  }

  bool isAfter(Timestamp other) {
    return value > other.value;
  }

  double seconds() {
    return (value as double) / 1000000.0;
  }
  double milliseconds() {
    return (value as double) / 1000.0;
  }
  factory Timestamp.fromMilliseconds(double milliseconds) {
    return Timestamp((milliseconds * 1000.0).toInt().toUnsigned(64));
  }
  factory Timestamp.fromSeconds(double seconds) {
    return Timestamp((seconds * 1000000.0).toInt().toUnsigned(64));
  }
}
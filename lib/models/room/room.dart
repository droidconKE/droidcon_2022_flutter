import 'package:freezed_annotation/freezed_annotation.dart';

part 'room.freezed.dart';

part 'room.g.dart';

@freezed
class Room with _$Room {
  const Room._();

  const factory Room({
    required int id,
    required String title,
  }) = _Room;

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
}

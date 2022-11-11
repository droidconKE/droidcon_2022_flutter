import 'package:freezed_annotation/freezed_annotation.dart';

import '../room/room.dart';
import '../speaker/speaker.dart';

part 'session.freezed.dart';

part 'session.g.dart';

@freezed
class Session with _$Session {
  const Session._();

  const factory Session({
    required String title,
    required String description,
    required String slug,
    @JsonKey(name: 'session_format') required String sessionFormat,
    @JsonKey(name: 'session_level') required String sessionLevel,
    @JsonKey(name: 'is_keynote') bool? isKeynote,
    @JsonKey(name: 'session_image') String? sessionImage,
    String? backgroundColor,
    String? borderColor,
    @JsonKey(name: 'is_serviceSession') bool? isServiceSession,
    @JsonKey(name: 'start_date_time') String? startDateTime,
    @JsonKey(name: 'start_time') String? startTime,
    @JsonKey(name: 'end_date_time') String? endDateTime,
    @JsonKey(name: 'end_time') String? endTime,
    required List<Speaker> speakers,
    List<Room>? rooms,
  }) = _Session;

  DateTime? get startDateTimeObject => DateTime.tryParse(startDateTime ?? '');

  DateTime? get endDateTimeObject => DateTime.tryParse(endDateTime ?? '');

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);
}

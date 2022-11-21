import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_filter.freezed.dart';

part 'session_filter.g.dart';

@freezed
class SessionFilter with _$SessionFilter {
  const SessionFilter._();

  const factory SessionFilter({
    String? level,
    String? room,
    String? format,
    String? topic,
  }) = _SessionFilter;

  factory SessionFilter.fromJson(Map<String, dynamic> json) =>
      _$SessionFilterFromJson(json);
}

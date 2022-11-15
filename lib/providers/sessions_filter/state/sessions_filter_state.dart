import 'package:droidcon_app/models/session_filter/session_filter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sessions_filter_state.freezed.dart';

@freezed
class SessionsFilterState with _$SessionsFilterState {
  factory SessionsFilterState.none() = _None;
  factory SessionsFilterState.bookmarked() = _Bookmarked;
  factory SessionsFilterState.custom(SessionFilter filter) = _Custom;
}

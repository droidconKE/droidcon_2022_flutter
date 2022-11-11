import 'package:freezed_annotation/freezed_annotation.dart';

part 'organizer.freezed.dart';

part 'organizer.g.dart';

@freezed
class Organizer with _$Organizer {
  const Organizer._();

  const factory Organizer({
    required String name,
    required String tagline,
    required String link,
    required String type,
    required String bio,
    @JsonKey(name: 'twitter_handle') required String twitterHandle,
    required String designation,
    required String photo,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _Organizer;

  factory Organizer.fromJson(Map<String, dynamic> json) =>
      _$OrganizerFromJson(json);
}

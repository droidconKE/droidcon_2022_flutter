import 'package:freezed_annotation/freezed_annotation.dart';

part 'sponsor.freezed.dart';

part 'sponsor.g.dart';

@freezed
class Sponsor with _$Sponsor {
  const Sponsor._();

  const factory Sponsor({
    required String name,
    required String tagline,
    required String link,
    @JsonKey(name: 'sponsor_type') required String sponsorType,
    required String logo,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _Sponsor;

  factory Sponsor.fromJson(Map<String, dynamic> json) =>
      _$SponsorFromJson(json);
}

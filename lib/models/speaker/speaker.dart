import 'package:freezed_annotation/freezed_annotation.dart';

part 'speaker.freezed.dart';

part 'speaker.g.dart';

@freezed
class Speaker with _$Speaker {
  const Speaker._();

  const factory Speaker({
    required String name,
    required String tagline,
    required String biography,
    required String avatar,
    String? twitter,
    String? facebook,
    String? linkedin,
    String? instagram,
    String? blog,
    @JsonKey(name: 'company_website') String? companyWebsite,
  }) = _Speaker;

  factory Speaker.fromJson(Map<String, dynamic> json) =>
      _$SpeakerFromJson(json);
}

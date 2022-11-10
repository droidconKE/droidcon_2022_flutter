import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_time_ago/get_time_ago.dart';

part 'feed.freezed.dart';

part 'feed.g.dart';

@freezed
class Feed with _$Feed {
  const Feed._();

  const factory Feed({
    String? title,
    required String body,
    String? topic,
    String? url,
    String? image,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _Feed;

  DateTime? get dateTimeCreated => DateTime.tryParse(createdAt);

  String get timeSinceCreation =>
      GetTimeAgo.parse(dateTimeCreated ?? DateTime.now());

  factory Feed.fromJson(Map<String, dynamic> json) => _$FeedFromJson(json);
}

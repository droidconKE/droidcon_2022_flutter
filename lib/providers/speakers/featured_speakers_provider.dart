import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/speaker/speaker.dart';
import 'speakers_provider.dart';

final featuredSpeakersProvider = FutureProvider<List<Speaker>>((ref) async {
  final speakers = await ref.watch(speakersProvider.future);

  final shuffledSpeakers = [...speakers]..shuffle();

  return shuffledSpeakers.take(4).toList();
});

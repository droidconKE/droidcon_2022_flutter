import 'package:droidcon_app/providers/speakers/speakers_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/speaker/speaker.dart';

final featuredSpeakersProvider = FutureProvider<List<Speaker>>((ref) async {
  final speakers = await ref.watch(speakersProvider.future);

  final shuffledSpeakers = [...speakers]..shuffle();

  return shuffledSpeakers.take(4).toList();
});

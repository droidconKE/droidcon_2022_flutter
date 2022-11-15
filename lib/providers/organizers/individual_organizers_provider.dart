import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/models.dart';
import 'organizers_provider.dart';

final individualOrganizersProvider =
    FutureProvider<List<Organizer>>((ref) async {
  final organizers = await ref.watch(organizersProvider.future);

  return organizers
      .where((organizer) => organizer.type == 'individual')
      .toList();
});

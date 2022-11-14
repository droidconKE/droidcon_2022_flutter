import 'package:droidcon_app/models/organizer/organizer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'organizers_provider.dart';

final companyOrganizersProvider = FutureProvider<List<Organizer>>((ref) async {
  final organizers = await ref.watch(organizersProvider.future);

  return organizers.where((organizer) => organizer.type == 'company').toList();
});

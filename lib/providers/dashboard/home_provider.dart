import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

final homeProvider = ChangeNotifierProvider<HomeProvider>(((ref) {
  final provider = HomeProvider();
  provider.initController();
  return provider;
}));

class HomeProvider extends ChangeNotifier {
  late final VideoPlayerController? videoPlayerController;

  void initController() {
    videoPlayerController = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    )..initialize().then((_) {
        videoPlayerController?.play();
        videoPlayerController?.setLooping(true);
        notifyListeners();
      });
  }

  void muteUnmute(double volume) {
    videoPlayerController?.setVolume(volume);
    notifyListeners();
  }

  void pausePlay(bool play) {
    play ? videoPlayerController?.play() : videoPlayerController?.pause();
    notifyListeners();
  }

  @override
  void dispose() {
    videoPlayerController?.dispose();
    super.dispose();
  }
}

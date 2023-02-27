import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class VideoProvider extends ChangeNotifier{
  VideoProvider({required this.controller});

  VideoPlayerController? controller;


  bool _isPlaying = false;

  bool get isPlaying=> _isPlaying;


  void checkPlaying({required bool isActive,required String status}){
    _isPlaying = isActive;
    switch(status){
      case 'play': {
        controller!.play();
      }
      break;
      case 'pause': {
        controller!.pause();
      }
      break;
      case 'again': {
        controller!.seekTo(Duration.zero);
      }
      break;
    }
    notifyListeners();
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tinhhuongmophong_120/modules/video_controls/pages/video_controls.dart';
import 'package:tinhhuongmophong_120/modules/video_controls/provider/video_provider.dart';

void main() {
  runApp(MaterialApp(
      home:MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(toolbarHeight: 0),
        body: VideoControls(
            url: "https://assets.mixkit.co/videos/preview/mixkit-group-of-friends-partying-happily-4640-large.mp4")
    );
  }
}


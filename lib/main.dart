import 'package:flutter/material.dart';
import 'package:tinhhuongmophong_120/modules/video_controls/pages/video_controls.dart';

void main() {
  runApp(MaterialApp(
      home:MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Rotate Widget")),
        body: VideoControls(
            url: "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4")
    );
  }
}


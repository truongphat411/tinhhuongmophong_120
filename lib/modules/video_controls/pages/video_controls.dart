import 'package:flutter/material.dart';
import 'package:tinhhuongmophong_120/modules/video_controls/components/pause_button.dart';
import 'package:tinhhuongmophong_120/modules/video_controls/components/play_button.dart';
import 'package:tinhhuongmophong_120/modules/video_controls/components/restart_button.dart';
import 'package:video_player/video_player.dart';

class VideoControls extends StatefulWidget {
  VideoControls({super.key, required this.url});
  String url;

  @override
  State<VideoControls> createState() => _VideoControls();
}

class _VideoControls extends State<VideoControls> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        setState(() {
          _controller.seekTo(const Duration(seconds: 10));
          _controller.play();
        });
      });
    _controller.play();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        ),
        const SizedBox(
          height: 10,
        ),
        VideoProgressIndicator(_controller,
            allowScrubbing: true,
            padding: const EdgeInsets.symmetric(horizontal: 10)),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(child: PlayButton(controller: _controller)),
            Expanded(
              child: PauseButton(
                controller: _controller,
              ),
            ),
            Expanded(
              child: ReStartButton(
                controller: _controller,
              ),
            )
          ],
        )
      ],
    ));
  }

  getVideoPosition() {
    var duration = Duration(
        milliseconds: _controller.value.position.inMilliseconds.round());
    return [duration.inMinutes, duration.inSeconds]
        .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
        .join(':');
  }
}

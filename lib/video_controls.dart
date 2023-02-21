import 'package:flutter/material.dart';
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
        setState(() {});
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
        //child: _controller.value.isInitialized ?
        body: Column(
      children: [
        AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        ),
        Text('${getVideoPosition()}'),
        Row(
          children: [
            InkWell(
              onTap: () {
                _controller.pause();
              },
              child: const Text('Pause'),
            ),
            const SizedBox(width: 10,),
            InkWell(
              onTap: () {
                _controller.play();
              },
              child: const Text('Play'),
            ),
          ],
        )

      ],
    ));
  }
  getVideoPosition() {
    var duration = Duration(milliseconds: _controller.value.position.inMilliseconds.round());
    return [duration.inMinutes, duration.inSeconds].map((seg) => seg.remainder(60).toString().padLeft(2, '0')).join(':');
  }
}



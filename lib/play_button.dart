import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayButton extends StatefulWidget {
  const PlayButton({Key? key, required this.controller}) : super(key: key);

  final VideoPlayerController controller;

  @override
  State<PlayButton> createState() => _PLayButtonState();
}

class _PLayButtonState extends State<PlayButton> {

  @override
  Widget build(BuildContext context) {

    var isPlaying;

    return InkWell(
      onTap: () {
        setState(() {
           widget.controller.play();
           widget.controller.value.isPlaying;
        });
      },
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: !widget.controller.value.isPlaying ? Colors.blue : Colors.black,
        ),
        width: 50,
        height: 50,
      ),
    );
  }
}

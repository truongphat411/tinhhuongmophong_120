import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PauseButton extends StatefulWidget {
  const PauseButton({Key? key, required this.controller}) : super(key: key);

  final VideoPlayerController controller;

  @override
  State<PauseButton> createState() => _PauseButtonState();
}

class _PauseButtonState extends State<PauseButton> {

  @override
  Widget build(BuildContext context) {

    var isPlaying;

    return InkWell(
      onTap: () {
        setState(() {
          widget.controller.pause();
          widget.controller.value.isPlaying;
        });
      },
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: widget.controller.value.isPlaying ? Colors.blue : Colors.black,
        ),
        width: 50,
        height: 50,
      ),
    );
  }
}

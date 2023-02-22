import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ReStartButton extends StatefulWidget {
  const ReStartButton({Key? key, required this.controller}) : super(key: key);

  final VideoPlayerController controller;

  @override
  State<ReStartButton> createState() => _PLayButtonState();
}

class _PLayButtonState extends State<ReStartButton> {

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
        setState(() {
          widget.controller.seekTo(Duration.zero);
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

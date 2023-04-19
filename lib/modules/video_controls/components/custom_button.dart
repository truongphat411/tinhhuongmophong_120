import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
        required this.controller,
        required this.icon,
        required this.text,
        required this.onClickCallback,
        this.color})
      : super(key: key);

  final VideoPlayerController controller;
  final IconData icon;
  final String text;
  final VoidCallback onClickCallback;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClickCallback,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color ?? Colors.blue,
        ),
        width: 100,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [Icon(icon), Text(text)],
          ),
        ),
      ),
    );
  }
}




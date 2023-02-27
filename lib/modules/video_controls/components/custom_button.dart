import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

//typedef PlayerCallback = void Function();

class CustomButton extends StatefulWidget {
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
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onClickCallback,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.color ?? Colors.blue,
        ),
        width: 100,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [Icon(widget.icon), Text(widget.text)],
          ),
        ),
      ),
    );
  }
}

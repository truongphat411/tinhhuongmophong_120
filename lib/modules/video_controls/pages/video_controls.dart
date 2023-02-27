import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:native_device_orientation/native_device_orientation.dart';
import 'package:provider/provider.dart';
import 'package:tinhhuongmophong_120/modules/video_controls/components/custom_button.dart';
import 'package:tinhhuongmophong_120/modules/video_controls/provider/video_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock/wakelock.dart';

class VideoControls extends StatefulWidget {
  VideoControls({super.key, required this.url});

  String url;

  @override
  State<VideoControls> createState() => _VideoControls();
}

class _VideoControls extends State<VideoControls> {
  late VideoPlayerController _controller;
  Orientation? target;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url)..initialize();
    // NativeDeviceOrientationCommunicator()
    //     .onOrientationChanged(useSensor: true)
    //     .listen((event) {
    //   final isPortrait = event == NativeDeviceOrientation.portraitUp;
    //   final isLandscape = event == NativeDeviceOrientation.landscapeLeft ||
    //       event == NativeDeviceOrientation.landscapeRight;
    //   final isTargetPortrait = target == Orientation.portrait;
    //   final isTargetLandscape = target == Orientation.landscape;
    //
    //   if (isPortrait && isTargetPortrait || isLandscape && isTargetLandscape) {
    //     target = null;
    //     SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    //   }
    // });
  }

  // void setOrientation(bool isPortrait) {
  //   if (isPortrait) {
  //     Wakelock.disable();
  //     SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
  //   } else {
  //     Wakelock.enable();
  //     SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  //   }
  // }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => VideoProvider(controller: _controller),
      child: Builder(
        builder: (context) {
          return Consumer<VideoProvider>(builder:
              (context, videoProvider, child) {
            return Scaffold(
                appBar: AppBar(title: const Text("120 tình huống mô phỏng")),
                body: Column(
                  children: [
                    _videoPlayer(context, videoProvider),
                    const SizedBox(
                      height: 10,
                    ),
                    VideoProgressIndicator(_controller,
                        allowScrubbing: true,
                        padding: const EdgeInsets.symmetric(horizontal: 10)),
                    const SizedBox(
                      height: 10,
                    ),
                    _controlsButton(context, videoProvider)
                  ],
                ));
          });
        },
      ),
    );
  }

  Widget _videoPlayer(BuildContext context, VideoProvider videoProvider){
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: Row(
              children: [
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: (){},
                  child: const Icon(
                    Icons.fullscreen,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 8),
              ],
            )),
      ],
    );
  }

  Widget _controlsButton(BuildContext context, VideoProvider videoProvider){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
            child: CustomButton(
                text: 'Phát video',
                controller: _controller,
                icon: Icons.play_arrow,
                color: videoProvider.isPlaying ? Colors.grey : Colors.blue,
                onClickCallback: () => videoProvider.isPlaying ? null : videoProvider.checkPlaying(isActive: true,status: 'play')
            )),
        Flexible(
            child: CustomButton(
                text: 'Dừng video',
                controller: _controller,
                icon: Icons.pause,
                color: videoProvider.isPlaying ? Colors.blue : Colors.grey,
                onClickCallback: () => videoProvider.isPlaying ? videoProvider.checkPlaying(isActive: false, status: 'pause') : null
            )),
        Flexible(
            child: CustomButton(
                text: 'Lặp lại',
                controller: _controller,
                icon: Icons.loop,
                color: videoProvider.isPlaying ? Colors.blue : Colors.grey,
                onClickCallback: () => videoProvider.isPlaying ? videoProvider.checkPlaying(isActive: true, status: 'again') : null
            )),
      ],
    );
  }
}

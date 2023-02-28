import 'package:auto_orientation/auto_orientation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:native_device_orientation/native_device_orientation.dart';
import 'package:provider/provider.dart';
import 'package:tinhhuongmophong_120/modules/video_controls/components/advanced_overlay_widget.dart';
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
  late VideoPlayerController controller;
  Orientation? target;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        setState(() {});
      });
    NativeDeviceOrientationCommunicator()
        .onOrientationChanged(useSensor: true)
        .listen((event) {
      final isPortrait = event == NativeDeviceOrientation.portraitUp;
      final isLandscape = event == NativeDeviceOrientation.landscapeLeft ||
          event == NativeDeviceOrientation.landscapeRight;
      final isTargetPortrait = target == Orientation.portrait;
      final isTargetLandscape = target == Orientation.landscape;

      if (isPortrait && isTargetPortrait || isLandscape && isTargetLandscape) {
        target = null;
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      }
    });
  }

  void setOrientation(bool isPortrait) {
    if (isPortrait) {
      Wakelock.disable();
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: SystemUiOverlay.values);
    } else {
      Wakelock.enable();
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => VideoProvider(controller: controller),
      child: Builder(
        builder: (context) {
          return Consumer<VideoProvider>(
              builder: (context, videoProvider, child) =>
                  controller.value.isInitialized
                      ? _videoPlayer(videoProvider)
                      : const Center(child: CircularProgressIndicator()));
        },
      ),
    );
  }

  Widget _videoPlayer(VideoProvider videoProvider) => OrientationBuilder(
        builder: (context, orientation) {
          final isPortrait = orientation == Orientation.portrait;

          setOrientation(isPortrait);

          return isPortrait
              ? Column(
                  children: [
                    Stack(
                      fit: StackFit.loose,
                      children: [
                        buildVideoPlayer(),
                        Positioned.fill(
                          child: AdvancedOverlayWidget(
                            controller: controller,
                            onClickedFullScreen: () {
                              target = isPortrait
                                  ? Orientation.landscape
                                  : Orientation.portrait;

                              if (isPortrait) {
                                AutoOrientation.landscapeRightMode();
                              } else {
                                AutoOrientation.portraitUpMode();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    _controlsButton(context, videoProvider)
                  ],
                )
              : Stack(
                  //fit: StackFit.expand,
                  alignment: Alignment.topLeft,
                  children: [
                    // _controlsButton(context, videoProvider),
                     buildVideoPlayer(),
                    Container(
                      color: Colors.red,
                      width: 100,
                      height: 100,
                    ),
                    Positioned.fill(
                      child: AdvancedOverlayWidget(
                        controller: controller,
                        onClickedFullScreen: () {
                          target = isPortrait
                              ? Orientation.landscape
                              : Orientation.portrait;

                          if (isPortrait) {
                            AutoOrientation.landscapeRightMode();
                          } else {
                            AutoOrientation.portraitUpMode();
                          }
                        },
                      ),
                    ),
                  ],
                );

          // return Stack(
          //   fit: isPortrait ? StackFit.loose : StackFit.expand,
          //   children: <Widget>[
          //     buildVideoPlayer(),
          //     Positioned.fill(
          //       child: AdvancedOverlayWidget(
          //         controller: controller,
          //         onClickedFullScreen: () {
          //           target = isPortrait
          //               ? Orientation.landscape
          //               : Orientation.portrait;
          //
          //           if (isPortrait) {
          //             AutoOrientation.landscapeRightMode();
          //           } else {
          //             AutoOrientation.portraitUpMode();
          //           }
          //         },
          //       ),
          //     ),
          //   ],
          // );
        },
      );

  Widget buildVideoPlayer() {
    final video = AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: VideoPlayer(controller),
    );

    return buildFullScreen(child: video);
  }

  Widget buildFullScreen({
    required Widget child,
  }) {
    final size = controller.value.size;
    final width = size.width;
    final height = size.height;

    return FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(width: width, height: height, child: child));
  }

  Widget _controlsButton(BuildContext context, VideoProvider videoProvider) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
            child: CustomButton(
                text: 'Phát video',
                controller: controller,
                icon: Icons.play_arrow,
                color: videoProvider.isPlaying ? Colors.grey : Colors.blue,
                onClickCallback: () => videoProvider.isPlaying
                    ? null
                    : videoProvider.checkPlaying(
                        isActive: true, status: 'play'))),
        Flexible(
            child: CustomButton(
                text: 'Dừng video',
                controller: controller,
                icon: Icons.pause,
                color: videoProvider.isPlaying ? Colors.blue : Colors.grey,
                onClickCallback: () => videoProvider.isPlaying
                    ? videoProvider.checkPlaying(
                        isActive: false, status: 'pause')
                    : null)),
        Flexible(
            child: CustomButton(
                text: 'Lặp lại',
                controller: controller,
                icon: Icons.loop,
                color: videoProvider.isPlaying ? Colors.blue : Colors.grey,
                onClickCallback: () => videoProvider.isPlaying
                    ? videoProvider.checkPlaying(
                        isActive: true, status: 'again')
                    : null)),
      ],
    );
  }
}

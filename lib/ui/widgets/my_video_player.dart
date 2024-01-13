import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:zone4/utils/constant.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MyVideoPlayer extends StatefulWidget {
  const MyVideoPlayer({super.key, required this.movieId});
  final String movieId;

  @override
  State<MyVideoPlayer> createState() => _MyVideoPlayerState();
}

class _MyVideoPlayerState extends State<MyVideoPlayer> {
  YoutubePlayerController? _ycontroller;

  @override
  void initState() {
    super.initState();
    _ycontroller = YoutubePlayerController(
        initialVideoId: widget.movieId,
        flags: const YoutubePlayerFlags(
          forceHD: true,
          mute: false,
          autoPlay: false,
          hideThumbnail: true,
        ));
  }

  @override
  void dispose() {
    super.dispose();
    _ycontroller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _ycontroller == null
        ? Center(
            child: SpinKitThreeInOut(color: kPrimaryColor1, size: 20),
          )
        : YoutubePlayer(
            controller: _ycontroller!,
            showVideoProgressIndicator: true,
            progressIndicatorColor: kPrimaryColor1,
            progressColors: ProgressBarColors(
              handleColor: kPrimaryColor1,
              playedColor: kPrimaryColor1,
            ),
            onEnded: (metaData) {
              _ycontroller!.play();
              _ycontroller!.pause();
            },
          );
  }
}

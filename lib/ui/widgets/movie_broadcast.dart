import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zone4/models/movie.dart';
import 'package:zone4/ui/widgets/my_video_player.dart';
import 'package:zone4/utils/constant.dart';

class MovieBroadcast extends StatefulWidget {
  const MovieBroadcast({
    super.key,
    required this.movie,
  });
  final Movie movie;

  @override
  State<MovieBroadcast> createState() => _MovieBroadcastState();
}

class _MovieBroadcastState extends State<MovieBroadcast> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          //color: kPrimaryColor,
          height: 250,
          width: MediaQuery.of(context).size.width,
          child: widget.movie.videoKey!.isEmpty
              ? Center(
                  child: Text(
                    'Sorry ! No video available for this movies',
                    style: GoogleFonts.poppins(color: Colors.white),
                  ),
                )
              : MyVideoPlayer(movieId: widget.movie.videoKey!.first),
        ),
        Positioned(
          right: -5,
          top: -7,
          child: Row(
            children: [
              Container(
                width: 30,
                height: 30,
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(170),
                    color: kPrimaryColor1),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.airplay_sharp,
                      size: 12,
                    )),
              ),
              Container(
                width: 30,
                height: 30,
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(170),
                    color: kPrimaryColor1),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 12,
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

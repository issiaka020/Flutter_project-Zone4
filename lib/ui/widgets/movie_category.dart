import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zone4/models/movie.dart';
import 'package:zone4/ui/widgets/movie_card.dart';

class MovieCategory extends StatelessWidget {
  const MovieCategory({
    super.key,
    required this.label,
    required this.movieList,
    required this.imageHeight,
    this.imageWidth,
    required this.callback,
  });
  final String label;
  final List<Movie> movieList;
  final double imageHeight;
  final double? imageWidth;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        Text(
          label,
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: imageHeight,
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              final currentPosition = notification.metrics.pixels;
              final maxPosition = notification.metrics.maxScrollExtent;

              if (currentPosition >= maxPosition / 2) {
                callback();
              }
              return true;
            },
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movieList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: imageWidth,
                  color: Colors.red.shade100,
                  child: Center(
                    child: movieList.isEmpty
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: Colors.black,
                          ))
                        : MovieCard(movie: movieList[index]),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

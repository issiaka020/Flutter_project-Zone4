import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zone4/models/movie.dart';
import 'package:zone4/ui/widgets/movie_card.dart';

class MovieCategoryCaroussel extends StatelessWidget {
  const MovieCategoryCaroussel({
    super.key,
    required this.label,
    required this.movieList,
    this.imageHeight,
    this.imageWidth,
    required this.callback,
  });

  final String label;
  final List<Movie> movieList;
  final double? imageHeight;
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
            child: CarouselSlider.builder(
              itemCount: movieList.length,
              itemBuilder: (context, index, realIndex) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    width: imageWidth,
                    child: MovieCard(movie: movieList[index]),
                  ),
                );
              },
              options: CarouselOptions(
                autoPlayInterval: const Duration(seconds: 1),
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlay: true,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                viewportFraction: 0.49,
                autoPlayAnimationDuration: const Duration(seconds: 3),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

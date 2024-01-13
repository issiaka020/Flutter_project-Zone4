import 'package:flutter/material.dart';
import 'package:zone4/models/movie.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:zone4/ui/widgets/screens/movie_details_page.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return MovieDetailsPage(movie: movie);
          },
        ));
      },
      child: CachedNetworkImage(
        imageUrl: movie.posterURL(),
        fit: BoxFit.fill,
        errorWidget: (context, url, error) {
          return const Center(
            child: Icon(Icons.error),
          );
        },
      ),
    );
  }
}

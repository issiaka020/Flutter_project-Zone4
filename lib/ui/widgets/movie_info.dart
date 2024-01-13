import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zone4/models/movie.dart';
import 'package:zone4/ui/widgets/custom_line.dart';

class MovieInfo extends StatelessWidget {
  const MovieInfo({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomLine(),
        Text(
          movie.name,
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          'Genres: ${movie.reformatGenres()}',
          style: GoogleFonts.poppins(
              color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w500),
        ),
        Row(
          children: [
            Text(
              'Corresponds: ${(movie.vote! * 10).toInt()} %',
              style: GoogleFonts.poppins(
                  color: Colors.green,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic),
            ),
            const SizedBox(width: 10),
            Text(
              'Corresponds: ${(movie.releaseDate!.substring(0, 4))} ',
              style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:zone4/models/movie.dart';
import 'package:zone4/repositories/data_repository.dart';
import 'package:zone4/ui/widgets/action_button.dart';
import 'package:zone4/ui/widgets/casting_card.dart';
import 'package:zone4/ui/widgets/casting_info.dart';
import 'package:zone4/ui/widgets/galery_card.dart';

import 'package:zone4/ui/widgets/movie_broadcast.dart';
import 'package:zone4/ui/widgets/movie_info.dart';
import 'package:zone4/ui/widgets/no_image_card.dart';
import 'package:zone4/utils/constant.dart';
import 'package:provider/provider.dart';

class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage({
    super.key,
    required this.movie,
  });
  final Movie movie;

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  Movie? newMovie;
  @override
  void initState() {
    super.initState();
    getMovieData();
  }

  void getMovieData() async {
    final dataProvider = Provider.of<DataRepository>(context, listen: false);
    Movie amovie = await dataProvider.getMovieDetails(movie: widget.movie);

    setState(() {
      newMovie = amovie;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: newMovie == null
          ? Center(
              child: SpinKitThreeInOut(color: kPrimaryColor1),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  MovieBroadcast(movie: newMovie!),
                  const SizedBox(height: 10),
                  MovieInfo(movie: newMovie!),
                  const SizedBox(height: 10),
                  ActionButton(
                      label: 'Play',
                      icon: Icons.play_arrow,
                      backgroundColor: Colors.white,
                      color: kBackgroundColor),
                  const SizedBox(height: 10),
                  ActionButton(
                    label: 'Download',
                    icon: Icons.download,
                    backgroundColor: Colors.grey.withOpacity(0.4),
                    color: Colors.white,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    newMovie!.description,
                    style:
                        GoogleFonts.poppins(color: Colors.white, fontSize: 15),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Casting',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 380,
                    child: CarouselSlider.builder(
                      itemCount: newMovie!.casting!.length,
                      itemBuilder: (context, index, realIndex) {
                        return newMovie!.casting![index].imageURL == null
                            ? CastingInfo(
                                originalName: newMovie!.casting![index].name,
                                characterName:
                                    newMovie!.casting![index].characterName,
                                displayImage: const NoImageCard())
                            : CastingInfo(
                                originalName: newMovie!.casting![index].name,
                                characterName:
                                    newMovie!.casting![index].characterName,
                                displayImage: CastingCard(
                                  person: newMovie!.casting![index],
                                ));
                      },
                      options: CarouselOptions(
                        height: 500,
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

                  Text(
                    'Gallery',
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),

                  // we are displaying the images
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: newMovie!.imagesURL!.length,
                      itemBuilder: (context, index) {
                        return GaleryCard(
                          posterPath: newMovie!.imagesURL![index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

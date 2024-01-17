import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:zone4/services/api.dart';

import 'package:zone4/utils/constant.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ActorDetailsPage extends StatelessWidget {
  const ActorDetailsPage({super.key, this.actorDetails});

  final Map<String, dynamic>? actorDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
            color: kPrimaryColor1,
          ),
        ],
      ),
      body: ListView(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(actorDetails!['name'],
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: kPrimaryColor1,
                      )),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: CircularPercentIndicator(
                      radius: 75.0,
                      lineWidth: 15.0,
                      animation: true,
                      animationDuration: 500,
                      percent: actorDetails!['popularity'] / 120 as double,
                      center: Text(
                        "${actorDetails!['popularity']}",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: kPrimaryColor1,
                        ),
                      ),
                      footer: Text(
                        "Popularity",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                          color: kPrimaryColor1,
                        ),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: const Color.fromARGB(255, 15, 87, 121),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadiusDirectional.circular(10),
                  child: CachedNetworkImage(
                    imageUrl:
                        API().baseImageURL + actorDetails!['profile_path'],
                    height: 350,
                    fit: BoxFit.contain,
                    errorWidget: (context, url, error) {
                      return const Center(child: Icon(Icons.error));
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(5),
            child: Text(
              'Biography',
              style: GoogleFonts.poppins(
                  color: kPrimaryColor1,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: actorDetails!['biography'] == null
                ? const Text('-')
                : Text(
                    actorDetails!['biography'],
                    style: GoogleFonts.montserrat(
                        color: Colors.white, fontSize: 16),
                  ),
          ),
          Container(
            padding: const EdgeInsets.all(1),
            child: Text(
              'Place and Birth day ',
              style: GoogleFonts.poppins(
                  color: kPrimaryColor1,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          actorDetails!['birthday'] == null
              ? const Text('-')
              : Text(
                  '${actorDetails!['birthday']} in ${actorDetails!['place_of_birth']} ',
                  style:
                      GoogleFonts.montserrat(color: Colors.white, fontSize: 16),
                ),
        ],
      ),
    );
  }
}

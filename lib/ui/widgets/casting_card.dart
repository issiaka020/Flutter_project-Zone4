import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zone4/models/person.dart';
import 'package:zone4/ui/widgets/screens/actor_detail_page.dart';

class CastingCard extends StatelessWidget {
  const CastingCard({super.key, required this.person, this.actorDetails});
  final Person person;
  final Map<String, dynamic>? actorDetails;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return ActorDetailsPage(
              actorDetails: actorDetails,
            );
          },
        ));
      },
      child: CachedNetworkImage(
        imageUrl: person.castingImageURL(),
        //height: 180,
        fit: BoxFit.contain,
        errorWidget: (context, url, error) {
          return const Center(child: Icon(Icons.error));
        },
      ),
    );
  }
}

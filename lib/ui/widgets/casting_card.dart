import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zone4/models/person.dart';

class CastingCard extends StatelessWidget {
  const CastingCard({super.key, required this.person});
  final Person person;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: person.castingImageURL(),
      //height: 180,
      fit: BoxFit.contain,
      errorWidget: (context, url, error) {
        return const Center(child: Icon(Icons.error));
      },
    );
  }
}

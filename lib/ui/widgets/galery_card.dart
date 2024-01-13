import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zone4/services/api.dart';

class GaleryCard extends StatelessWidget {
  const GaleryCard({
    super.key,
    required this.posterPath,
  });

  final String posterPath;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: CachedNetworkImage(
          imageUrl: API().baseImageURL + posterPath,
          width: 350,
          fit: BoxFit.cover,
          errorWidget: (context, url, error) {
            return const Center(
              child: Icon(Icons.error),
            );
          },
        ),
      ),
    );
  }
}

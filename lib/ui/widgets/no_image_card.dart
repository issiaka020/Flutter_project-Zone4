import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NoImageCard extends StatelessWidget {
  const NoImageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:
          'https://th.bing.com/th/id/OIP.Qtt9CEritLrsYoiKoo5D4QAAAA?w=165&h=176&c=7&r=0&o=5&pid=1.7',
      height: 240,
      fit: BoxFit.fill,
      errorWidget: (context, url, error) {
        return const Center(child: Icon(Icons.error));
      },
    );
  }
}

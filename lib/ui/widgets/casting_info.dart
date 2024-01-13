import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zone4/utils/constant.dart';

class CastingInfo extends StatelessWidget {
  const CastingInfo({
    super.key,
    required this.originalName,
    required this.characterName,
    required this.displayImage,
  });
  final String originalName;
  final String characterName;
  final Widget displayImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            width: 180,
            child: displayImage,
          ),
        ),
        SizedBox(
          child: Text(originalName,
              style: GoogleFonts.poppins(
                color: kPrimaryColor1,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              )),
        ),
        SizedBox(
          child: Text(characterName,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              )),
        ),
      ],
    );
  }
}

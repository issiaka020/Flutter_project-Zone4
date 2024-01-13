import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomLine extends StatelessWidget {
  const CustomLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 35,
          width: 25,
          child: Image.asset(
            'assets/images/Z.png',
          ),
        ),
        const SizedBox(width: 1),
        Text(
          'Films',
          style: GoogleFonts.poppins(
              fontSize: 15, fontStyle: FontStyle.italic, color: Colors.white70),
        ),
      ],
    );
  }
}

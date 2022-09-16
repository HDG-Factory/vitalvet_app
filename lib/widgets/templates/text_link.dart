import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextLink extends StatelessWidget {
  final String? text1;
  final String? text2;
  final Color? color1;
  final Color? color2;
  final String navigateTo;

  const TextLink(
      {Key? key,
      required this.navigateTo,
      this.text1,
      this.text2,
      this.color1,
      this.color2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.popAndPushNamed(context, navigateTo),
      child: RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
          style: GoogleFonts.montserrat(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
          children: [
            TextSpan(
              text: text1,
              style: GoogleFonts.montserrat(
                color: color1,
              ),
            ),
            TextSpan(
              text: text2,
              style: GoogleFonts.montserrat(
                color: color2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

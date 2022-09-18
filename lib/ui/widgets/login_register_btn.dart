import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginRegisterBtn extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  const LoginRegisterBtn(
      {Key? key, required this.text, this.onPressed, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed ?? () => {},
      style: ElevatedButton.styleFrom(
        primary: backgroundColor,
        fixedSize: const Size(200, 45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        text,
        style: GoogleFonts.montserrat(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

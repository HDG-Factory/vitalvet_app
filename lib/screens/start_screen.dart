import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitalvet_app/constants/constants.dart';
import 'package:vitalvet_app/widgets/custom_screen.dart';

import '../utils/screen_size.dart';
import '../widgets/app_icon_svg.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScreen(body: _body(context));
  }

  Widget _body(BuildContext context) {
    forceRerender(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      constraints: const BoxConstraints(maxWidth: 400),
                      child: CustomPaint(
                        painter: AppIconSvg(),
                        size: Size(
                            MediaQuery.of(context).size.width,
                            (MediaQuery.of(context).size.width *
                                    0.9941860465116279)
                                .toDouble()),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'VITALVET',
                      style: GoogleFonts.mPlusRounded1c(
                        color: Colors.blue,
                        fontSize: 48,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 6,
                      ),
                    ),
                    Text(
                      'Servicios veterinarios',
                      style: GoogleFonts.mPlusRounded1c(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _loginBtn(context),
                    const SizedBox(height: 10),
                    _registerBtn(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _loginBtn(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, LOGIN_ROUTE);
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        fixedSize: const Size(200, 45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        'Iniciar Sesión',
        style: GoogleFonts.montserrat(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _registerBtn(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, REGISTER_ROUTE);
      },
      style: ElevatedButton.styleFrom(
        primary: const Color.fromARGB(255, 85, 91, 105),
        fixedSize: const Size(200, 45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        'Registrarse',
        style: GoogleFonts.montserrat(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

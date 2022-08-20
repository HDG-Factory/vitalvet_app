import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/custom_screen.dart';
import '../widgets/custom_title_bar.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScreen(body: _body(context));
  }

  Widget _body(BuildContext context) {
    int largeBreakPoint = 1200;
    int mediumBreakPoint = 700;
    isLargeScreenOrMore() =>
        MediaQuery.of(context).size.width > largeBreakPoint;
    isMediumScreenOrMore() =>
        MediaQuery.of(context).size.width > mediumBreakPoint;

    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.centerRight,
      children: [
        Transform.translate(
          offset: isLargeScreenOrMore()
              ? Offset((MediaQuery.of(context).size.width * -0.1), 0)
              : Offset((MediaQuery.of(context).size.width * -0.15), 0),
          child: const FittedBox(
            fit: BoxFit.cover,
            child: Image(
              image: AssetImage(
                'assets/shiba_inu.png',
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: (isLargeScreenOrMore())
                  ? Alignment.lerp(
                      Alignment.center, Alignment.centerRight, 0.6)!
                  : (isMediumScreenOrMore())
                      ? Alignment.center
                      : Alignment.centerRight,
              colors: (isMediumScreenOrMore())
                  ? [
                      Colors.white.withOpacity(0.2),
                      Colors.white.withOpacity(1),
                    ]
                  : [
                      Colors.white.withOpacity(0.5),
                      Colors.white.withOpacity(0.5),
                    ],
            ),
          ),
        ),
        Align(
          alignment: (isMediumScreenOrMore())
              ? Alignment.centerRight
              : Alignment.center,
          child: SizedBox(
            width: (isLargeScreenOrMore())
                ? MediaQuery.of(context).size.width * 0.4
                : (isMediumScreenOrMore())
                    ? MediaQuery.of(context).size.width * 0.5
                    : MediaQuery.of(context).size.width * 0.7,
            child: Padding(
              padding: (isMediumScreenOrMore())
                  ? const EdgeInsets.only(right: 50.0)
                  : const EdgeInsets.only(right: 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Iniciar sesión',
                    textAlign: TextAlign.right,
                    style: GoogleFonts.montserrat(
                      fontSize: (isLargeScreenOrMore())
                          ? 50
                          : (isMediumScreenOrMore())
                              ? 40
                              : 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Spacer(),
                      InkWell(
                        onTap: () =>
                            Navigator.popAndPushNamed(context, '/register'),
                        child: RichText(
                          textAlign: TextAlign.right,
                          text: TextSpan(
                            style: GoogleFonts.montserrat(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                            children: [
                              TextSpan(
                                text: '¿No tienes cuenta? ',
                                style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: 'Regístrate',
                                style: GoogleFonts.montserrat(
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Correo',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(18))),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Contraseña',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(18))),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      _loginBtn(context),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _loginBtn(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/login');
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
}

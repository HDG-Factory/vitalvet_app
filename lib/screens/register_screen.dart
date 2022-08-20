// import 'package:bitsdojo_window/bitsdojo_window.dart';
// import 'package:flutter/material.dart';

// import '../widgets/custom_screen.dart';
// import '../widgets/custom_title_bar.dart';

// class RegisterScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return CustomScreen(body: _body(context));
//   }

//   Widget _body(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Text('Iniciar sesión'),
//           const Text('¿Ya tienes cuenta? Iniciar sesión'),
//           Row(
//             children: const [
//               Expanded(
//                 child: TextField(
//                   decoration: InputDecoration(
//                     labelText: 'Nombres',
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: TextField(
//                   decoration: InputDecoration(
//                     labelText: 'Apellidos',
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const TextField(
//             decoration: InputDecoration(
//               labelText: 'Correo',
//             ),
//           ),
//           const TextField(
//             decoration: InputDecoration(
//               labelText: 'Contraseña',
//             ),
//           ),
//           _registerBtn(context),
//         ],
//       ),
//     );
//   }

//   Widget _registerBtn(BuildContext context) {
//     return ElevatedButton(
//       child: const Text('Registrarse'),
//       onPressed: () {
//         Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/custom_screen.dart';
import '../widgets/custom_title_bar.dart';

class RegisterScreen extends StatelessWidget {
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
        const FittedBox(
          fit: BoxFit.cover,
          child: Image(
            image: AssetImage(
              'assets/cat.jpg',
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: (isLargeScreenOrMore())
                  ? Alignment.lerp(Alignment.center, Alignment.centerLeft, 0.6)!
                  : (isMediumScreenOrMore())
                      ? Alignment.center
                      : Alignment.centerLeft,
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
              ? Alignment.centerLeft
              : Alignment.center,
          child: SizedBox(
            width: (isLargeScreenOrMore())
                ? MediaQuery.of(context).size.width * 0.4
                : (isMediumScreenOrMore())
                    ? MediaQuery.of(context).size.width * 0.5
                    : MediaQuery.of(context).size.width * 0.7,
            child: Padding(
              padding: (isMediumScreenOrMore())
                  ? const EdgeInsets.only(left: 50.0)
                  : const EdgeInsets.only(left: 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Registrarse',
                    textAlign: TextAlign.left,
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
                      InkWell(
                        onTap: () =>
                            Navigator.popAndPushNamed(context, '/login'),
                        child: RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                            style: GoogleFonts.montserrat(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                            children: [
                              TextSpan(
                                text: '¿Ya tienes cuenta? ',
                                style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: 'Inicia sesión',
                                style: GoogleFonts.montserrat(
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
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
                      _loginBtn(context),
                      const Spacer(),
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
        'Registrarse',
        style: GoogleFonts.montserrat(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

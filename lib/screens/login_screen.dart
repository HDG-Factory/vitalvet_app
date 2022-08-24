import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitalvet_app/utils/screen_size.dart';
import 'package:vitalvet_app/widgets/text_link.dart';

import '../widgets/custom_screen.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/login_register_btn.dart';

class LoginScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScreen(body: _body(context));
  }

  Widget _body(BuildContext context) {
    MediaQuery.of(context);
    const backgroundImage = 'assets/shiba_inu.png';

    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.centerRight,
      children: [
        _backgroundImage(backgroundImage, context),
        _backgroundLinearGradient(context),
        Form(
          key: formKey,
          child: _mainColumn(
            context,
            [
              _loginTitle(context),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Spacer(),
                  const TextLink(
                      navigateTo: '/register',
                      text1: '¿No tienes cuenta? ',
                      color1: Colors.black,
                      text2: 'Regístrate',
                      color2: Colors.blue),
                  if (!isMediumOrMoreScreen) const Spacer()
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                labelText: 'Correo',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingrese un correo';
                  } else if (!value.contains('@')) {
                    return 'Por favor ingrese un correo válido';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                labelText: 'Contraseña',
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor ingrese una contraseña';
                  } else if (value.length < 6) {
                    return 'La contraseña debe tener más de 6 caracteres';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  const Spacer(),
                  _loginBtn(context),
                  if (!isMediumOrMoreScreen) const Spacer(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Transform _backgroundImage(String fileName, BuildContext context) {
    return Transform.translate(
      offset: (isLargeOrMoreScreen) ? Offset(-10.wb, 0) : Offset(-15.wb, 0),
      child: FittedBox(
        fit: BoxFit.cover,
        child: Image(
          image: AssetImage(fileName),
        ),
      ),
    );
  }

  Container _backgroundLinearGradient(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: (isLargeOrMoreScreen)
              ? Alignment.lerp(Alignment.center, Alignment.centerRight, 0.6)!
              : (isMediumOrMoreScreen)
                  ? Alignment.center
                  : Alignment.centerRight,
          colors: (isMediumOrMoreScreen)
              ? [
                  Theme.of(context).scaffoldBackgroundColor.withOpacity(0.2),
                  Theme.of(context).scaffoldBackgroundColor.withOpacity(1),
                ]
              : [
                  Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
                  Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
                ],
        ),
      ),
    );
  }

  Align _mainColumn(BuildContext context, List<Widget> children) {
    return Align(
      alignment:
          (isMediumOrMoreScreen) ? Alignment.centerRight : Alignment.center,
      child: SizedBox(
        width: (isLargeOrMoreScreen)
            ? 40.wb
            : (isMediumOrMoreScreen)
                ? 50.wb
                : 70.wb,
        child: Padding(
          padding: (isMediumOrMoreScreen)
              ? const EdgeInsets.only(right: 50.0)
              : const EdgeInsets.only(right: 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: children,
          ),
        ),
      ),
    );
  }

  Text _loginTitle(BuildContext context) {
    return Text(
      'Iniciar sesión',
      textAlign: (isMediumOrMoreScreen) ? TextAlign.right : TextAlign.center,
      style: GoogleFonts.montserrat(
          fontSize: (isLargeOrMoreScreen)
              ? 50
              : (isMediumOrMoreScreen)
                  ? 40
                  : 30,
          fontWeight: FontWeight.w700,
          color: Theme.of(context).primaryColor),
    );
  }

  Widget _loginBtn(BuildContext context) {
    return LoginRegisterBtn(
      text: 'Iniciar sesión',
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        }
      },
    );
  }
}

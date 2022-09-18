import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pfile_picker/pfile_picker.dart';
import 'package:vitalvet_app/utils/constants.dart';
import 'package:vitalvet_app/utils/screen_size.dart';
import 'package:vitalvet_app/ui/widgets/templates/custom_date_picker.dart';

import '../widgets/templates/custom_screen.dart';
import '../widgets/templates/custom_text_field.dart';
import '../widgets/login_register_btn.dart';
import '../widgets/templates/text_link.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  int currentIndex = 0;
  int maxIndex = 3;

  final pageController = PageController();
  final animationDuration = const Duration(milliseconds: 200);
  final curve = Curves.easeIn;

  String? fileName = null;

  @override
  Widget build(BuildContext context) {
    return CustomScreen(body: _body(context));
  }

  Widget _body(BuildContext context) {
    forceRerender(context);
    final registerSteps = _registerSteps();

    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.centerRight,
      children: [
        _backgroundImage('assets/cat.jpg'),
        _backgroundLinearGradient(context),
        Form(
          key: formKey,
          child: _mainColumn(
            context,
            [
              _registerTitle(context),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                height: 200,
                child: Listener(
                  onPointerSignal: (pointerSignal) {
                    if (pointerSignal is PointerScrollEvent) {
                      if (pointerSignal.scrollDelta.dy > 0) {
                        if (formKey.currentState!.validate()) {
                          // formKey.currentState!.save();
                          pageController.nextPage(curve: curve, duration: animationDuration);
                          setState(() {
                            if (currentIndex < maxIndex) {
                              currentIndex++;
                            }
                          });
                        }
                      } else {
                        pageController.previousPage(duration: animationDuration, curve: curve);
                        setState(() {
                          if (currentIndex > 0) {
                            currentIndex--;
                          }
                        });
                      }
                    }
                  },
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: pageController,
                    scrollDirection: Axis.horizontal,
                    pageSnapping: true,
                    onPageChanged: (index) {
                      index = index;
                    },
                    children: registerSteps,
                  ),
                ),
              ),
              if (currentIndex > 0)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(registerSteps.length, (int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                      child: InkWell(
                        onTap: () {
                          pageController.animateToPage(index, duration: animationDuration, curve: curve);
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: 6,
                          width: (index == currentIndex) ? 25 : 15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: (index == currentIndex) ? Colors.blue : Colors.blue.withOpacity(0.5),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              SizedBox(
                height: (currentIndex > 0) ? 20 : 8,
              ),
              (isMediumOrMoreScreen)
                  ? Row(
                      children: [
                        _registerBtn(context),
                        const SizedBox(width: 10),
                        if (currentIndex > 0) _backBtn(context),
                        const Spacer(),
                      ],
                    )
                  : Column(
                      children: [
                        _registerBtn(context),
                        const SizedBox(height: 10),
                        if (currentIndex > 0) _backBtn(context),
                      ],
                    ),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> _registerSteps() {
    return [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              if (!isMediumOrMoreScreen) const Spacer(),
              const TextLink(
                  navigateTo: LOGIN_ROUTE, text1: '¿Ya tienes cuenta? ', color1: Colors.black, text2: 'Inicia sesión', color2: Colors.blue),
              const Spacer(),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            labelText: 'Nombres',
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor ingrese sus nombres';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            labelText: 'Apellidos',
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor ingrese sus apellidos';
              }
              return null;
            },
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomDatePicker(
            labelText: 'Fecha de nacimiento',
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor seleccione una fecha de nacimiento';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            labelText: 'Colegiatura',
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor ingrese una colegiatura';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
            labelText: 'Reseña',
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor ingrese una reseña';
              }
              return null;
            },
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // CustomTextField(labelText: 'Foto de perfil'),
          ElevatedButton(
            onPressed: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                dialogTitle: 'Seleccionar foto',
                type: FileType.image,
              );

              if (result == null) return;
              setState(() {
                fileName = result.files.first.path;
              });
            },
            style: ElevatedButton.styleFrom(
              primary: const Color.fromARGB(255, 85, 91, 105),
              fixedSize: const Size(200, 45),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              'Buscar imagen',
              style: GoogleFonts.montserrat(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    ];
  }

  Container _backgroundLinearGradient(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: (isLargeOrMoreScreen)
              ? Alignment.lerp(Alignment.center, Alignment.centerLeft, 0.6)!
              : (isMediumOrMoreScreen)
                  ? Alignment.center
                  : Alignment.centerLeft,
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
      alignment: (isMediumOrMoreScreen) ? Alignment.centerLeft : Alignment.center,
      child: SizedBox(
        width: (isLargeOrMoreScreen)
            ? 40.wb
            : (isMediumOrMoreScreen)
                ? 50.wb
                : 70.wb,
        child: Padding(
          padding: (isMediumOrMoreScreen) ? const EdgeInsets.only(left: 50.0) : const EdgeInsets.only(left: 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: children,
          ),
        ),
      ),
    );
  }

  Text _registerTitle(BuildContext context) {
    return Text(
      'Registrarse',
      textAlign: (isMediumOrMoreScreen) ? TextAlign.left : TextAlign.center,
      style: GoogleFonts.montserrat(
        fontSize: (isLargeOrMoreScreen)
            ? 50
            : (isMediumOrMoreScreen)
                ? 40
                : 30,
        fontWeight: FontWeight.w700,
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  FittedBox _backgroundImage(String fileName) {
    return FittedBox(
      fit: BoxFit.cover,
      child: Image(
        image: AssetImage(
          fileName,
        ),
      ),
    );
  }

  Widget _registerBtn(BuildContext context) {
    return LoginRegisterBtn(
      text: (currentIndex == 0 || currentIndex == maxIndex) ? 'Registrarse' : 'Siguiente',
      onPressed: () {
        if (formKey.currentState!.validate()) {
          // formKey.currentState!.save();

          if (currentIndex < maxIndex) {
            setState(() {
              currentIndex++;
              pageController.animateToPage(currentIndex, duration: animationDuration, curve: curve);
            });
          } else {
            Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
          }
        }
      },
    );
  }

  Widget _backBtn(BuildContext context) {
    return LoginRegisterBtn(
      text: 'Atrás',
      backgroundColor: const Color.fromARGB(255, 85, 91, 105),
      onPressed: () {
        if (currentIndex > 0) {
          setState(() {
            currentIndex--;
            pageController.animateToPage(currentIndex, duration: animationDuration, curve: curve);
          });
        }
      },
    );
  }
}

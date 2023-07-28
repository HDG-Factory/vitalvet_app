import 'package:flutter/material.dart';
import 'package:vitalvet_app/ui/pages/medical_attentions/register_medical_attentions.dart';
import 'package:vitalvet_app/ui/pages/patient_page.dart';
import 'package:vitalvet_app/ui/pages/profiles/register_profile.dart';
import 'package:vitalvet_app/ui/pages/welcome_page.dart';

class AppRouter {
  MaterialPageRoute? generateRoute(RouteSettings settings) {
    final routeName = settings.name;

    switch (routeName) {
      case '/':
        return MaterialPageRoute(builder: (_) => const WelcomePage());
      case '/register_profile':
        return MaterialPageRoute(builder: (_) => const RegisterProfile());
      case '/register_medical_attention':
        return MaterialPageRoute(builder: (_) => const RegisterMedicalAttention());
      case '/patient_page':
        return MaterialPageRoute(builder: (_) => const PatientPage());
      default:
        return null;
    }
  }
}

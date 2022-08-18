import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vitalvet_app/blocs/side_bar/side_bar_bloc.dart';
import 'package:vitalvet_app/constants/constants.dart';
import 'package:vitalvet_app/screens/home_screen.dart';
import 'package:vitalvet_app/screens/login_screen.dart';
import 'package:vitalvet_app/screens/register_screen.dart';
import 'package:vitalvet_app/screens/start_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case START_ROUTE:
        return MaterialPageRoute(builder: (context) => StartScreen());
      case REGISTER_ROUTE:
        return MaterialPageRoute(builder: (context) => RegisterScreen());
      case LOGIN_ROUTE:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case HOME_ROUTE:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => SideBarBloc(),
                  child: HomeScreen(),
                ));
      default:
        return null;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vitalvet_app/blocs/side_bar/extension/side_bar_extension_bloc.dart';
import 'package:vitalvet_app/blocs/side_bar/selection/side_bar_selection_bloc.dart';
import 'package:vitalvet_app/constants/constants.dart';
import 'package:vitalvet_app/screens/home_screen.dart';
import 'package:vitalvet_app/screens/login_screen.dart';
import 'package:vitalvet_app/screens/register_screen.dart';
import 'package:vitalvet_app/screens/start_screen.dart';
import 'package:vitalvet_app/views/clinical_histories_view.dart';
import 'package:vitalvet_app/views/profile_view.dart';
import 'package:vitalvet_app/views/settings_view.dart';

import '../views/calendar_view.dart';
import '../views/not_found_view.dart';
import '../views/pets_view.dart';

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
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<SideBarSelectionBloc>(
                create: (_) => SideBarSelectionBloc(),
              ),
              BlocProvider<SideBarExtensionBloc>(
                create: (_) => SideBarExtensionBloc(),
              ),
            ],
            child: HomeScreen(
              viewContent: Expanded(
                child: BlocBuilder<SideBarSelectionBloc, int>(
                  builder: (context, int currentIndex) {
                    switch (currentIndex) {
                      case PETS_VIEW_INDEX:
                        return const PetsView();
                      case CLINICAL_HISTORIES_VIEW_INDEX:
                        return const ClinicalHistoriesView();
                      case CALENDAR_VIEW_INDEX:
                        return const CalendarView();
                      case PROFILE_VIEW_INDEX:
                        return const ProfileView();
                      case NOTIFICATIONS_INDEX:
                        return const NotFoundView();
                      case SETTINGS_VIEW_INDEX:
                        return const SettingsView();
                      default:
                        return const NotFoundView();
                    }
                  },
                ),
              ),
            ),
          ),
        );
      default:
        return null;
    }
  }
}

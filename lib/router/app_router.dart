import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vitalvet_app/blocs/account/account_bloc.dart';
import 'package:vitalvet_app/blocs/side_bar/extension/side_bar_extension_bloc.dart';
import 'package:vitalvet_app/constants/constants.dart';
import 'package:vitalvet_app/screens/home_screen.dart';
import 'package:vitalvet_app/screens/login_screen.dart';
import 'package:vitalvet_app/screens/register_screen.dart';
import 'package:vitalvet_app/screens/start_screen.dart';
import 'package:vitalvet_app/views/add_pet_view.dart';
import 'package:vitalvet_app/views/clinical_histories_view.dart';
import 'package:vitalvet_app/views/profile_view.dart';
import 'package:vitalvet_app/views/settings_view.dart';

import '../blocs/pets/pets_list/pets_list_bloc.dart';
import '../views/calendar_view.dart';
import '../views/not_found_view.dart';
import '../views/pets_list_view.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final routeNames = settings.name!.split('/');
    switch (routeNames[0]) {
      case START_ROUTE:
        return MaterialPageRoute(builder: (context) => StartScreen());
      case REGISTER_ROUTE:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => AccountBloc(),
                  child: const RegisterScreen(),
                ));
      case LOGIN_ROUTE:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => AccountBloc(),
                  child: LoginScreen(),
                ));
      case HOME_ROUTE:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<SideBarExtensionBloc>(
                create: (_) => SideBarExtensionBloc(),
              ),
            ],
            child: HomeScreen(
              currentView: routeNames[1],
              viewContent: Expanded(
                  child: (() {
                if (routeNames.length > 2) {
                  switch (routeNames[2]) {
                    case ADD_PET_VIEW_ROUTE:
                      return AddPetView();
                  }
                }
                switch (routeNames[1]) {
                  case PETS_LIST_VIEW_ROUTE:
                    return BlocProvider(
                      create: (context) => PetsListBloc(),
                      child: const PetsListView(),
                    );
                  case CLINICAL_HISTORIES_VIEW_ROUTE:
                    return const ClinicalHistoriesView();
                  case CALENDAR_VIEW_ROUTE:
                    return const CalendarView();
                  case PROFILE_VIEW_ROUTE:
                    return const ProfileView();
                  case NOTIFICATIONS_ROUTE:
                    return const NotFoundView();
                  case SETTINGS_VIEW_ROUTE:
                    return const SettingsView();
                }
                return const NotFoundView();
              }())),
            ),
          ),
        );
      default:
        return null;
    }
  }
}

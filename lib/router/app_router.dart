import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vitalvet_app/blocs/account/account_bloc.dart';
import 'package:vitalvet_app/blocs/owners/delete_owner/delete_owner_bloc.dart';
import 'package:vitalvet_app/blocs/owners/owners_list/owners_list_bloc.dart';
import 'package:vitalvet_app/blocs/pets/add_pet/add_pet_bloc.dart';
import 'package:vitalvet_app/blocs/pets/edit_pet/edit_pet_bloc.dart';
import 'package:vitalvet_app/blocs/pets/get_pet/get_pet_bloc.dart';
import 'package:vitalvet_app/blocs/side_bar/extension/side_bar_extension_bloc.dart';
import 'package:vitalvet_app/blocs/species/species_list/species_list_bloc.dart';
import 'package:vitalvet_app/blocs/title_bar/title_bar_bloc.dart';
import 'package:vitalvet_app/utils/constants.dart';
import 'package:vitalvet_app/ui/screens/home_screen.dart';
import 'package:vitalvet_app/ui/screens/login_screen.dart';
import 'package:vitalvet_app/ui/screens/register_screen.dart';
import 'package:vitalvet_app/ui/screens/start_screen.dart';
import 'package:vitalvet_app/ui/views/pet_views/add_pet_view.dart';
import 'package:vitalvet_app/ui/views/pet_medical_attention_view.dart';
import 'package:vitalvet_app/ui/views/pet_medical_history_view.dart';
import 'package:vitalvet_app/ui/views/profile_view.dart';
import 'package:vitalvet_app/ui/views/settings_view.dart';
import 'package:vitalvet_app/blocs/pets/pets_list/pets_list_bloc.dart';
import 'package:vitalvet_app/ui/views/calendar_view.dart';
import 'package:vitalvet_app/ui/views/pet_views/edit_pet_view.dart';
import 'package:vitalvet_app/ui/views/not_found_view.dart';
import 'package:vitalvet_app/ui/views/pets_list_view.dart';

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
              BlocProvider<TitleBarBloc>(
                create: (_) => TitleBarBloc(),
              ),
            ],
            child: HomeScreen(
              currentView: routeNames[1],
              viewContent: Expanded(
                  child: (() {
                if (routeNames.length > 2) {
                  switch (routeNames[2]) {
                    case ADD_PET_VIEW_ROUTE:
                      final addPetBloc = AddPetBloc();
                      final deleteOwnerBloc = DeleteOwnerBloc();

                      return MultiBlocProvider(
                        providers: [
                          BlocProvider(
                            create: (_) => OwnersListBloc(),
                          ),
                          BlocProvider(
                            create: (_) => deleteOwnerBloc,
                          ),
                          BlocProvider(
                            create: (_) => SpeciesListBloc(),
                          ),
                          BlocProvider(
                            create: (_) => addPetBloc,
                          ),
                        ],
                        child: AddPetView(
                          addPetBloc: addPetBloc,
                          deleteOwnerBloc: deleteOwnerBloc,
                        ),
                      );
                    case EDIT_PET_VIEW_ROUTE:
                      final editPetBloc = EditPetBloc();
                      final deleteOwnerBloc = DeleteOwnerBloc();

                      return MultiBlocProvider(
                        providers: [
                          BlocProvider(
                            create: (_) => OwnersListBloc(),
                          ),
                          BlocProvider(
                            create: (_) => deleteOwnerBloc,
                          ),
                          BlocProvider(
                            create: (_) => SpeciesListBloc(),
                          ),
                          BlocProvider(
                            create: (_) => editPetBloc,
                          ),
                          BlocProvider(
                            create: (_) => GetPetBloc(),
                          ),
                        ],
                        child: EditPetView(
                          petId: settings.arguments as int,
                          editPetBloc: editPetBloc,
                          deleteOwnerBloc: deleteOwnerBloc,
                        ),
                      );
                    case PET_MEDICAL_HISTORY_VIEW_ROUTE:
                      return BlocProvider(
                        create: (context) => PetsListBloc(),
                        child: const PetMedicalHistoryView(),
                      );
                    case PET_MEDICAL_ATTENTION_VIEW_ROUTE:
                      return BlocProvider(
                        create: (context) => PetsListBloc(),
                        child: PetMedicalAttentionView(),
                      );
                  }
                }
                switch (routeNames[1]) {
                  case PETS_LIST_VIEW_ROUTE:
                    return BlocProvider(
                      create: (context) => PetsListBloc(),
                      child: const PetsListView(),
                    );
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

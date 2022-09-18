import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profiles_list_event.dart';
part 'profiles_list_state.dart';

class ProfilesListBloc extends Bloc<ProfilesListEvent, ProfilesListState> {
  ProfilesListBloc() : super(ProfilesListInitial()) {
    on<ProfilesListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_profile_event.dart';
part 'add_profile_state.dart';

class AddProfileBloc extends Bloc<AddProfileEvent, AddProfileState> {
  AddProfileBloc() : super(AddProfileInitial()) {
    on<AddProfileEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

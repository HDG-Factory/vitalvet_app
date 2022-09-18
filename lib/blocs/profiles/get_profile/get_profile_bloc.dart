import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_profile_event.dart';
part 'get_profile_state.dart';

class GetProfileBloc extends Bloc<GetProfileEvent, GetProfileState> {
  GetProfileBloc() : super(GetProfileInitial()) {
    on<GetProfileEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

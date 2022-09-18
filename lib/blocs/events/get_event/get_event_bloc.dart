import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_event_event.dart';
part 'get_event_state.dart';

class GetEventBloc extends Bloc<GetEventEvent, GetEventState> {
  GetEventBloc() : super(GetEventInitial()) {
    on<GetEventEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

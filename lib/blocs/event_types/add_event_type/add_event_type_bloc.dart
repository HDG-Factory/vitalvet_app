import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_event_type_event.dart';
part 'add_event_type_state.dart';

class AddEventTypeBloc extends Bloc<AddEventTypeEvent, AddEventTypeState> {
  AddEventTypeBloc() : super(AddEventTypeInitial()) {
    on<AddEventTypeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'edit_event_type_event.dart';
part 'edit_event_type_state.dart';

class EditEventTypeBloc extends Bloc<EditEventTypeEvent, EditEventTypeState> {
  EditEventTypeBloc() : super(EditEventTypeInitial()) {
    on<EditEventTypeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

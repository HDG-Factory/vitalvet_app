import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'edit_event_event.dart';
part 'edit_event_state.dart';

class EditEventBloc extends Bloc<EditEventEvent, EditEventState> {
  EditEventBloc() : super(EditEventInitial()) {
    on<EditEventEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

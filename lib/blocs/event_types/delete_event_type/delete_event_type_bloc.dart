import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'delete_event_type_event.dart';
part 'delete_event_type_state.dart';

class DeleteEventTypeBloc extends Bloc<DeleteEventTypeEvent, DeleteEventTypeState> {
  DeleteEventTypeBloc() : super(DeleteEventTypeInitial()) {
    on<DeleteEventTypeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

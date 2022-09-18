import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'delete_event_event.dart';
part 'delete_event_state.dart';

class DeleteEventBloc extends Bloc<DeleteEventEvent, DeleteEventState> {
  DeleteEventBloc() : super(DeleteEventInitial()) {
    on<DeleteEventEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

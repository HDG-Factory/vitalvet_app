import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'event_types_list_event.dart';
part 'event_types_list_state.dart';

class EventTypesListBloc extends Bloc<EventTypesListEvent, EventTypesListState> {
  EventTypesListBloc() : super(EventTypesListInitial()) {
    on<EventTypesListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

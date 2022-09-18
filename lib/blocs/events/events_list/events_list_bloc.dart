import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'events_list_event.dart';
part 'events_list_state.dart';

class EventsListBloc extends Bloc<EventsListEvent, EventsListState> {
  EventsListBloc() : super(EventsListInitial()) {
    on<EventsListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

part of 'events_list_bloc.dart';

abstract class EventsListState extends Equatable {
  const EventsListState();
  
  @override
  List<Object> get props => [];
}

class EventsListInitial extends EventsListState {}

part of 'event_types_list_bloc.dart';

abstract class EventTypesListState extends Equatable {
  const EventTypesListState();
  
  @override
  List<Object> get props => [];
}

class EventTypesListInitial extends EventTypesListState {}

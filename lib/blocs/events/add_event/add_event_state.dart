part of 'add_event_bloc.dart';

abstract class AddEventState extends Equatable {
  const AddEventState();
  
  @override
  List<Object> get props => [];
}

class AddEventInitial extends AddEventState {}

part of 'get_event_bloc.dart';

abstract class GetEventState extends Equatable {
  const GetEventState();
  
  @override
  List<Object> get props => [];
}

class GetEventInitial extends GetEventState {}

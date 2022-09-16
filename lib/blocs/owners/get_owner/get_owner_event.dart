part of 'get_owner_bloc.dart';

abstract class GetOwnerEvent extends Equatable {
  const GetOwnerEvent();

  @override
  List<Object> get props => [];
}

class LoadOwnerEvent extends GetOwnerEvent {
  final int? id;

  const LoadOwnerEvent({this.id});
}

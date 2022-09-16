part of 'delete_owner_bloc.dart';

abstract class DeleteOwnerEvent extends Equatable {
  const DeleteOwnerEvent();

  @override
  List<Object> get props => [];
}

class DeleteCreatedOwnerEvent extends DeleteOwnerEvent {
  final int? id;

  const DeleteCreatedOwnerEvent({this.id});
}

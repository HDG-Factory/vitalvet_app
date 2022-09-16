part of 'add_owner_bloc.dart';

abstract class AddOwnerEvent extends Equatable {
  const AddOwnerEvent();

  @override
  List<Object> get props => [];
}

class AddNewOwnerEvent extends AddOwnerEvent {
  final String? name;
  final String? lastname;
  final String? birthday;
  final String? direction;
  final String? phone;
  final String? dni;
  final String? email;

  const AddNewOwnerEvent(
      {this.birthday,
      this.direction,
      this.phone,
      this.dni,
      this.email,
      this.name,
      this.lastname});
}

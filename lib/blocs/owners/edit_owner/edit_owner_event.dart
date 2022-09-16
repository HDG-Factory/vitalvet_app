part of 'edit_owner_bloc.dart';

abstract class EditOwnerEvent extends Equatable {
  const EditOwnerEvent();

  @override
  List<Object> get props => [];
}

class EditCreatedOwnerEvent extends EditOwnerEvent {
  final int? id;
  final String? name;
  final String? lastname;
  final String? birthday;
  final String? direction;
  final String? phone;
  final String? dni;
  final String? email;

  const EditCreatedOwnerEvent(
      {this.id,
      this.birthday,
      this.direction,
      this.phone,
      this.dni,
      this.email,
      this.name,
      this.lastname});
}

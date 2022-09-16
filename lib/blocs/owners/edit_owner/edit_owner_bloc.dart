import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vitalvet_app/services/owner_api.service.dart';

part 'edit_owner_event.dart';
part 'edit_owner_state.dart';

class EditOwnerBloc extends Bloc<EditOwnerEvent, EditOwnerState> {
  EditOwnerBloc() : super(EditOwnerInitial()) {
    on<EditCreatedOwnerEvent>((event, emit) async {
      if (event.id == null ||
          event.name == null ||
          event.name!.isEmpty ||
          event.lastname == null ||
          event.lastname!.isEmpty ||
          event.birthday == null ||
          event.birthday!.isEmpty ||
          event.direction == null ||
          event.direction!.isEmpty ||
          event.phone == null ||
          event.phone!.isEmpty) {
        emit(EditOwnerError());
        return;
      }

      int ownerId = event.id!;

      final birthdayData = event.birthday!.split('/');
      DateTime birthdayDate = DateTime(
        int.parse(birthdayData[2]),
        int.parse(birthdayData[1]),
        int.parse(birthdayData[0]),
      );
      String formattedBirthday = birthdayDate.toString().split(' ')[0];

      String? dni =
          (event.dni != null && event.dni!.isNotEmpty) ? event.dni : null;
      String? email =
          (event.email != null && event.email!.isNotEmpty) ? event.email : null;

      final ownerData = {
        'name': event.name,
        'lastname': event.lastname,
        'birthday': formattedBirthday,
        'direction': event.direction,
        'phone': event.phone,
        'dni': dni,
        'email': email,
      };

      emit(EditingOwner());
      await OwnerApiService()
          .updateOwner(ownerId, ownerData)
          .then((response) async {
        if (response.statusCode == 200) {
          emit(OwnerEdited());
        } else {
          emit(EditOwnerError());
        }
        print(response);
      });
    });
  }
}

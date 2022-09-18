import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vitalvet_app/services/owner_api.service.dart';

part 'add_owner_event.dart';
part 'add_owner_state.dart';

class AddOwnerBloc extends Bloc<AddOwnerEvent, AddOwnerState> {
  AddOwnerBloc() : super(AddOwnerInitial()) {
    on<AddNewOwnerEvent>((event, emit) async {
      if (event.name == null ||
          event.name!.isEmpty ||
          event.lastname == null ||
          event.lastname!.isEmpty ||
          event.birthday == null ||
          event.birthday!.isEmpty ||
          event.direction == null ||
          event.direction!.isEmpty ||
          event.phone == null ||
          event.phone!.isEmpty) {
        emit(AddOwnerError());
        return;
      }

      final birthdayData = event.birthday!.split('/');
      DateTime birthdayDate = DateTime(
        int.parse(birthdayData[2]),
        int.parse(birthdayData[1]),
        int.parse(birthdayData[0]),
      );

      String name = event.name!.trim();
      String lastname = event.lastname!.trim();
      String formattedBirthday = birthdayDate.toString().split(' ')[0];
      String direction = event.direction!.trim();
      String phone = event.phone!.trim();
      String? dni = (event.dni != null && event.dni!.isNotEmpty) ? event.dni : null;
      String? email = (event.email != null && event.email!.isNotEmpty) ? event.email : null;

      final ownerData = {
        'name': name,
        'lastname': lastname,
        'birthday': formattedBirthday,
        'direction': direction,
        'phone': phone,
        'dni': dni,
        'email': email,
      };

      emit(AddingOwner());
      await OwnerApiService().createOwner(ownerData).then((response) async {
        if (response.statusCode == 201) {
          emit(OwnerAdded());
        } else {
          emit(AddOwnerError());
        }
        print(response);
      });
    });
  }
}

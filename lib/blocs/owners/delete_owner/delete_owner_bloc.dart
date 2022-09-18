import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vitalvet_app/services/owner_api.service.dart';

part 'delete_owner_event.dart';
part 'delete_owner_state.dart';

class DeleteOwnerBloc extends Bloc<DeleteOwnerEvent, DeleteOwnerState> {
  DeleteOwnerBloc() : super(DeleteOwnerInitial()) {
    on<DeleteCreatedOwnerEvent>((event, emit) async {
      if (event.id == null) {
        emit(DeleteOwnerError());
        return;
      }

      int ownerId = event.id!;
      emit(DeletingOwner());
      await OwnerApiService().deleteOwner(ownerId).then((response) {
        if (response.statusCode == 200) {
          emit(OwnerDeleted());
        } else {
          emit(DeleteOwnerError());
        }
      });
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vitalvet_app/services/owner_api.service.dart';

part 'get_owner_event.dart';
part 'get_owner_state.dart';

class GetOwnerBloc extends Bloc<GetOwnerEvent, GetOwnerState> {
  GetOwnerBloc() : super(GetOwnerInitial()) {
    on<LoadOwnerEvent>((event, emit) async {
      int ownerId = event.id!;
      emit(LoadingOwner());
      await OwnerApiService().getOwnerById(ownerId).then((response) {
        if (response.statusCode == 200) {
          emit(OwnerLoaded(owner: response.data));
        } else {}
      });
    });
  }
}

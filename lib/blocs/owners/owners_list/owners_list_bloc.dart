import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vitalvet_app/services/owner_api.service.dart';

part 'owners_list_event.dart';
part 'owners_list_state.dart';

class OwnersListBloc extends Bloc<OwnersListEvent, OwnersListState> {
  OwnersListBloc() : super(OwnersListInitial()) {
    on<LoadOwnersListEvent>((event, emit) async {
      emit(LoadingOwnersList());
      await OwnerApiService().getAllOwners().then((response) {
        if (response.statusCode == 200) {
          emit(OwnersListLoaded(owners: response.data));
        } else {}
        print(response);
      });
    });
  }
}

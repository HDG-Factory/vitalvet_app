import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vitalvet_app/constants/constants.dart';

part 'side_bar_selection_event.dart';

class SideBarSelectionBloc extends Bloc<SideBarSelectionEvent, int> {
  SideBarSelectionBloc() : super(PETS_VIEW_INDEX) {
    on<ChangeSideBarSelectionEvent>((event, emit) {
      emit(event.newIndex);
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vitalvet_app/constants/constants.dart';

part 'side_bar_event.dart';
part 'side_bar_state.dart';

class SideBarBloc extends Bloc<SideBarEvent, SideBarState> {
  SideBarBloc() : super(const SideBarSelection(PETS_VIEW_INDEX)) {
    on<ChangeSideBarSelectionEvent>((event, emit) {
      emit(SideBarSelection(event.newIndex));
    });
  }
}

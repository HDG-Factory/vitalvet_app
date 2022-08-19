import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'side_bar_extension_event.dart';

class SideBarExtensionBloc extends Bloc<SideBarExtensionEvent, bool> {
  SideBarExtensionBloc() : super(false) {
    on<ChangeSideBarExtensionEvent>((event, emit) {
      emit(event.newValue);
    });
  }
}

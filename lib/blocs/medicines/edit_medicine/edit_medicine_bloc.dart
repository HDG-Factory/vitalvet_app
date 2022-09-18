import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'edit_medicine_event.dart';
part 'edit_medicine_state.dart';

class EditMedicineBloc extends Bloc<EditMedicineEvent, EditMedicineState> {
  EditMedicineBloc() : super(EditMedicineInitial()) {
    on<EditMedicineEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

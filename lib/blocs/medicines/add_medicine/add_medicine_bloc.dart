import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_medicine_event.dart';
part 'add_medicine_state.dart';

class AddMedicineBloc extends Bloc<AddMedicineEvent, AddMedicineState> {
  AddMedicineBloc() : super(AddMedicineInitial()) {
    on<AddMedicineEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

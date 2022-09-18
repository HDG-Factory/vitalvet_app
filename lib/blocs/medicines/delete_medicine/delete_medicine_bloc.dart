import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'delete_medicine_event.dart';
part 'delete_medicine_state.dart';

class DeleteMedicineBloc extends Bloc<DeleteMedicineEvent, DeleteMedicineState> {
  DeleteMedicineBloc() : super(DeleteMedicineInitial()) {
    on<DeleteMedicineEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

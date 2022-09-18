import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_medical_attention_event.dart';
part 'add_medical_attention_state.dart';

class AddMedicalAttentionBloc extends Bloc<AddMedicalAttentionEvent, AddMedicalAttentionState> {
  AddMedicalAttentionBloc() : super(AddMedicalAttentionInitial()) {
    on<AddMedicalAttentionEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

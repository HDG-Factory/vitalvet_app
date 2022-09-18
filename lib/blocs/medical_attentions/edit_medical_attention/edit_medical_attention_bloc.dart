import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'edit_medical_attention_event.dart';
part 'edit_medical_attention_state.dart';

class EditMedicalAttentionBloc extends Bloc<EditMedicalAttentionEvent, EditMedicalAttentionState> {
  EditMedicalAttentionBloc() : super(EditMedicalAttentionInitial()) {
    on<EditMedicalAttentionEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

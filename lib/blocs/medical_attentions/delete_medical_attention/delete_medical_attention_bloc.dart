import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'delete_medical_attention_event.dart';
part 'delete_medical_attention_state.dart';

class DeleteMedicalAttentionBloc extends Bloc<DeleteMedicalAttentionEvent, DeleteMedicalAttentionState> {
  DeleteMedicalAttentionBloc() : super(DeleteMedicalAttentionInitial()) {
    on<DeleteMedicalAttentionEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

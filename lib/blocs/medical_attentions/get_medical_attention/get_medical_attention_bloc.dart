import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_medical_attention_event.dart';
part 'get_medical_attention_state.dart';

class GetMedicalAttentionBloc extends Bloc<GetMedicalAttentionEvent, GetMedicalAttentionState> {
  GetMedicalAttentionBloc() : super(GetMedicalAttentionInitial()) {
    on<GetMedicalAttentionEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

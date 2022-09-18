import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'medical_attentions_list_event.dart';
part 'medical_attentions_list_state.dart';

class MedicalAttentionsListBloc extends Bloc<MedicalAttentionsListEvent, MedicalAttentionsListState> {
  MedicalAttentionsListBloc() : super(MedicalAttentionsListInitial()) {
    on<MedicalAttentionsListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

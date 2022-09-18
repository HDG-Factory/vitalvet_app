import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'medicines_list_event.dart';
part 'medicines_list_state.dart';

class MedicinesListBloc extends Bloc<MedicinesListEvent, MedicinesListState> {
  MedicinesListBloc() : super(MedicinesListInitial()) {
    on<MedicinesListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

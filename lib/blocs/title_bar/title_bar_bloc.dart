import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'title_bar_event.dart';

class TitleBarBloc extends Bloc<TitleBarEvent, VoidCallback?> {
  TitleBarBloc() : super(null) {
    on<ChangeTitleBarEvent>((event, emit) {
      emit(event.onPressed);
    });
  }
}

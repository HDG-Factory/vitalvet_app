part of 'medicines_list_bloc.dart';

abstract class MedicinesListState extends Equatable {
  const MedicinesListState();
  
  @override
  List<Object> get props => [];
}

class MedicinesListInitial extends MedicinesListState {}

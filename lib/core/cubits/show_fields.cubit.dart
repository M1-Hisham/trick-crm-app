import 'package:flutter_bloc/flutter_bloc.dart';

class ShowFieldsCubit extends Cubit<bool> {
  ShowFieldsCubit() : super(false);
  bool isShowFields = false;

  void showFields() {
    isShowFields = true;
    emit(isShowFields);
  }

  void hideFields() {
    isShowFields = false;
    emit(isShowFields);
  }
}

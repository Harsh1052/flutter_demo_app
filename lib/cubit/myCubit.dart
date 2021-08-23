import 'package:flutter_bloc/flutter_bloc.dart';

class MyCubit extends Cubit<bool> {
  bool isEdit = false;
  MyCubit() : super(false);

  changeValue() {
    emit(!state);
  }
}

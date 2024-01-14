import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/cubit/user_cubit/user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  UserCubit get(context) => BlocProvider.of(context);

  bool isMale = true;
  double height = 180;
  int weight = 50;
  int age = 10;
  double result=0;

  calcPerfectWeight() {
    result = weight/ pow(height/100, 2);
    emit(CalcWeightState());
    return result.round();
  }
}

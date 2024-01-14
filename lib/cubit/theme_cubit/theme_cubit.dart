import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/myCache/sharedPref.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  ThemeCubit get(context)=>BlocProvider.of(context);

  bool isDark=false;

  changeThemeMode(){
    isDark=!isDark;
    MyCache.putBool(sharedKey: "dark", value: isDark);
    emit(ChangeThemeState());
  }

  getThemeData(){
    isDark= MyCache.getBool(sharedKey: "dark");
    emit(GetThemeDataState());
  }


}

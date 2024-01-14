import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/cubit/theme_cubit/theme_cubit.dart';
import 'package:untitled/cubit/user_cubit/user_cubit.dart';
import 'package:untitled/myCache/sharedPref.dart';
import 'package:untitled/screens/bmiCalculator.dart';
import 'package:untitled/screens/splashScreen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyCache.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserCubit(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: Colors.blue
            ),
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}

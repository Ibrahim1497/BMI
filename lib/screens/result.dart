import 'package:flutter/material.dart';
import 'package:untitled/cubit/user_cubit/user_cubit.dart';

import '../cubit/theme_cubit/theme_cubit.dart';

class Result extends StatelessWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = UserCubit().get(context);
    var cubit1=ThemeCubit().get(context);
        return Scaffold(
          backgroundColor: cubit1.isDark ? Colors.black : Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "BMI is: ",
                      style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 60,
                          color: cubit1.isDark ? Colors.white:Colors.black ,),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      color: Colors.blue,
                      child: Text("${cubit.calcPerfectWeight()}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 200)),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    cubit.calcPerfectWeight();
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_back_ios,size: 40,),
                      Text(
                        "Calculate",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );

  }

}


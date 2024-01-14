import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/cubit/theme_cubit/theme_cubit.dart';
import 'package:untitled/cubit/user_cubit/user_cubit.dart';
import 'package:untitled/screens/result.dart';

class BMICalculatorScreen extends StatefulWidget {
  const BMICalculatorScreen({super.key});

  @override
  State<BMICalculatorScreen> createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  @override
  void initState() {
    super.initState();
    ThemeCubit().get(context).getThemeData();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = UserCubit().get(context);
    var cubit1 = ThemeCubit().get(context);
    return BlocConsumer<ThemeCubit, ThemeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: cubit1.isDark ? Colors.black : Colors.white,
          appBar: AppBar(
            title: Text("BMI Calculator"),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  cubit1.changeThemeMode();
                },
                icon: Icon(Icons.dark_mode),
                color: cubit1.isDark ? Colors.black : Colors.white,
              )
            ],
          ),
          body: Column(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            cubit.isMale = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color:
                                  cubit.isMale ? Colors.blue : Colors.grey[400],
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Icon(
                                Icons.man,
                                size: 100,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Male",
                                style: TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            cubit.isMale = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: !cubit.isMale
                                  ? Colors.blue
                                  : Colors.grey[400],
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Icon(
                                Icons.woman,
                                size: 100,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Female",
                                style: TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "HEIGHT",
                          style: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${cubit.height.round()}",
                              style: TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "CM",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Slider(
                            value: cubit.height,
                            max: 220,
                            min: 130,
                            onChanged: (value) {
                              setState(() {
                                cubit.height = value;
                              });
                              print(value);
                            })
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Text(
                                "Weight",
                                style: TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "${cubit.weight}",
                                style: TextStyle(
                                    fontSize: 50, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    onPressed: () {
                                      setState(() {
                                        cubit.weight++;
                                      });
                                    },
                                    child: Text(
                                      "+",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    heroTag: "weight+",
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  FloatingActionButton(
                                    onPressed: () {
                                      setState(() {
                                        cubit.weight--;
                                      });
                                    },
                                    child: Text(
                                      "-",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    heroTag: "weight-",
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Text(
                                "Age",
                                style: TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "${cubit.age}",
                                style: TextStyle(
                                    fontSize: 50, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                    onPressed: () {
                                      setState(() {
                                        cubit.age++;
                                      });
                                    },
                                    child: Text(
                                      "+",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    heroTag: "age+",
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  FloatingActionButton(
                                    onPressed: () {
                                      setState(() {
                                        cubit.age--;
                                      });
                                    },
                                    child: Text(
                                      "-",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    heroTag: "age-",
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    cubit.calcPerfectWeight();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Result()));
                  },
                  child: Text(
                    "Calculate",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

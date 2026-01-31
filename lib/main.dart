import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tesk_count/features/cubit/cubit.dart';
import 'package:tesk_count/features/home/HomeScreen.dart';

void main() => runApp(const BMI());

class BMI extends StatelessWidget {
  const BMI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => BmiCubit(),
        child: Homescreen(),
      ),
    );
  }
}

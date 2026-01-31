// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tesk_count/core/colors_manger.dart';
import 'package:tesk_count/core/style.dart';
import 'package:tesk_count/features/cubit/cubit.dart';
import 'package:tesk_count/features/cubit/states.dart';
import 'package:tesk_count/features/home/widgets/generder_selection.dart';
import 'package:tesk_count/features/home/widgets/age&weight.dart';
import 'package:tesk_count/features/results/resultsScreen.dart';
import 'package:tesk_count/features/results/widgets/getResult.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primaryColor,
      appBar: AppBar(
        backgroundColor: ColorsManager.primaryColor,
        title: const Text("BMI Calculator", style: FontManager.primaryStyle),
        centerTitle: true,
        elevation: 8,
        shadowColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            Row(
              spacing: 12,
              children: [
                Expanded(
                  child: BlocBuilder<BmiCubit, BmiState>(
                    builder: (context, state) {
                      return SizedBox(
                        height: 150,
                        child: GenerderSelection(
                          icon: Icons.male,
                          genderText: 'Male',
                          onPress: () =>
                              context.read<BmiCubit>().selectGender('Male'),
                          isSelected: state.gender == 'Male',
                        ),
                      );
                    },
                  ),
                ),

                Expanded(
                  child: BlocBuilder<BmiCubit, BmiState>(
                    builder: (context, state) {
                      return SizedBox(
                        height: 150,
                        child: GenerderSelection(
                          icon: Icons.female,
                          genderText: 'Female',
                          onPress: () =>
                              context.read<BmiCubit>().selectGender('Female'),
                          isSelected: state.gender == 'Female',
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),

            const Spacer(),

            Container(
              height: 220,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: ColorsManager.thirdColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Text("Height", style: FontManager.secondaryStyle),
                  const SizedBox(height: 8),
                  BlocBuilder<BmiCubit, BmiState>(
                    builder: (context, state) {
                      return Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: state.height.toString(),
                              style: FontManager.primaryStyle.copyWith(
                                fontSize: 40,
                              ),
                            ),
                            TextSpan(
                              text: ' cm',
                              style: FontManager.secondaryStyle,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  BlocBuilder<BmiCubit, BmiState>(
                    builder: (context, state) {
                      return Slider(
                        activeColor: Colors.pink,
                        min: 0,
                        max: 300,
                        value: state.height.toDouble(),
                        onChanged: (value) =>
                            context.read<BmiCubit>().changeHeight(value),
                      );
                    },
                  ),
                ],
              ),
            ),
            const Spacer(),

            Row(
              children: [
                Expanded(
                  child: BlocBuilder<BmiCubit, BmiState>(
                    builder: (context, state) {
                      return AgeWeight(
                        isAge: false,
                        age: state.age,
                        weight: state.weight,
                        onPress1: () =>
                            context.read<BmiCubit>().decreaseWeight(),
                        onPress2: () =>
                            context.read<BmiCubit>().increaseWeight(),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: BlocBuilder<BmiCubit, BmiState>(
                    builder: (context, state) {
                      return AgeWeight(
                        isAge: true,
                        age: state.age,
                        weight: state.weight,
                        onPress1: () => context.read<BmiCubit>().decreaseAge(),
                        onPress2: () => context.read<BmiCubit>().increaseAge(),
                      );
                    },
                  ),
                ),
              ],
            ),

            const Spacer(),
            SizedBox(
              height: 70,
              child: BlocBuilder<BmiCubit, BmiState>(
                builder: (context, state) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultsScreen(
                            bmiResult: state.bmi,
                            resultText: getResultText(state.bmi),
                            interpretation: getInterpretation(state.bmi),
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'Calculate',
                      style: FontManager.secondaryStyle.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

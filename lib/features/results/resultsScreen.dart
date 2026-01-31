// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tesk_count/core/colors_manger.dart';
import 'package:tesk_count/core/style.dart';

class ResultsScreen extends StatelessWidget {
  final double bmiResult;
  final String resultText;
  final String interpretation;

  const ResultsScreen({
    super.key,
    required this.bmiResult,
    required this.resultText,
    required this.interpretation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primaryColor,
      appBar: AppBar(
        backgroundColor: ColorsManager.primaryColor,
        title: const Text('BMI Calculator', style: FontManager.primaryStyle),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Your Result', style: FontManager.primaryStyle),
          ),

          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: ColorsManager.primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: const TextStyle(
                      color: Color(0xFF24D876),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    bmiResult.toStringAsFixed(1),
                    style: FontManager.primaryStyle,
                  ),

                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: FontManager.primaryStyle,
                  ),
                ],
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: ColorsManager.selectColor,
              height: 70,
              child: const Center(
                child: Text('RE-CALCULATE', style: FontManager.primaryStyle),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

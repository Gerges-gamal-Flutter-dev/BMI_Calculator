// ignore_for_file: camel_case_types, must_be_immutable, file_names, annotate_overrides

import 'package:flutter/material.dart';
import 'package:tesk_count/core/colors_manger.dart';
import 'package:tesk_count/core/style.dart';

class AgeWeight extends StatefulWidget {
  final bool isAge;
  int age = 20;
  int weight = 50;
  Function() onPress1;
  Function() onPress2;

  AgeWeight({
    super.key,
    required this.isAge,
    required this.age,
    required this.weight,
    required this.onPress1,
    required this.onPress2,
  });

  State<AgeWeight> createState() => _value_selectionState();
}

class _value_selectionState extends State<AgeWeight> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: ColorsManager.thirdColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.isAge ? 'Age' : 'Weight',
              style: FontManager.secondaryStyle,
            ),
            Text(
              widget.isAge ? widget.age.toString() : widget.weight.toString(),
              style: FontManager.primaryStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 15,
              children: [
                IconButton(
                  onPressed: widget.onPress1,
                  icon: Icon(
                    Icons.remove_circle,
                    size: 30,
                    color: ColorsManager.secondaryColor,
                  ),
                ),

                IconButton(
                  onPressed: widget.onPress2,
                  icon: Icon(
                    Icons.add_circle,
                    size: 30,
                    color: ColorsManager.secondaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

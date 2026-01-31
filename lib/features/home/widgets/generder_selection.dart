import 'package:flutter/material.dart';
import 'package:tesk_count/core/colors_manger.dart';
import 'package:tesk_count/core/style.dart';

class GenerderSelection extends StatelessWidget {
  final IconData icon;
  final String genderText;
  final Function() onPress;
  final bool isSelected;
  const GenerderSelection({
    super.key,
    required this.icon,
    required this.genderText,
    required this.onPress,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          decoration: BoxDecoration(
            color: isSelected
                ? ColorsManager.selectColor
                : ColorsManager.thirdColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Icon(icon, color: ColorsManager.secondaryColor, size: 100),
              Text(genderText, style: FontManager.secondaryStyle),
            ],
          ),
        ),
      ),
    );
  }
}

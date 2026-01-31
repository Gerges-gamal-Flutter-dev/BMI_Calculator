// ignore_for_file: file_names

double calculateBMI(double weightKg, double heightCm) {
  double heightMeter = heightCm / 100;
  double bmi = weightKg / (heightMeter * heightMeter);
  return bmi;
}


String getResultText(double bmi) {
  if (bmi >= 25) {
    return 'Overweight';
  } else if (bmi > 18.5) {
    return 'Normal';
  } else {
    return 'Underweight';
  }
}

String getInterpretation(double bmi) {
  if (bmi >= 25) {
    return 'You have a higher than normal body weight. Try to exercise more.';
  } else if (bmi > 18.5) {
    return 'You have a normal body weight. Good job!';
  } else {
    return 'You have a lower than normal body weight. You can eat a bit more.';
  }
}

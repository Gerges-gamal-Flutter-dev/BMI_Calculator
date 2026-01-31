class BmiState {
  final String gender;
  final int height;
  final int weight;
  final int age;

  const BmiState({
    this.gender = '',
    this.height = 170,
    this.weight = 70,
    this.age = 20,
  });

  double get bmi {
    final h = height / 100;
    return weight / (h * h);
  }

  String get resultText {
    if (bmi >= 25) return 'Overweight';
    if (bmi > 18.5) return 'Normal';
    return 'Underweight';
  }

  String get interpretation {
    if (bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (bmi > 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }

  BmiState copyWith({
    String? gender,
    int? height,
    int? weight,
    int? age,
  }) {
    return BmiState(
      gender: gender ?? this.gender,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      age: age ?? this.age,
    );
  }
}

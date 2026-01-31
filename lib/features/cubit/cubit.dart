import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tesk_count/features/cubit/states.dart';

class BmiCubit extends Cubit<BmiState> {
  BmiCubit() : super(const BmiState());

  void selectGender(String gender) =>
      emit(state.copyWith(gender: gender));

  void changeHeight(double value) =>
      emit(state.copyWith(height: value.toInt()));

  void increaseWeight() =>
      emit(state.copyWith(weight: state.weight + 1));

  void decreaseWeight() =>
      emit(state.copyWith(weight: state.weight - 1));

  void increaseAge() =>
      emit(state.copyWith(age: state.age + 1));

  void decreaseAge() =>
      emit(state.copyWith(age: state.age - 1));
}

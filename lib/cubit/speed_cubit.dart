import 'package:flutter_bloc/flutter_bloc.dart';

class SpeedCubit extends Cubit<double> {
  SpeedCubit() : super(0);

  void calculateSpeed(double distance, double time) {
    emit(distance / time);
  }
}

import 'package:bloc_test/model/student_model.dart';
import 'package:bloc_test/state/student.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit() : super(StudentState.initial());

  void addStudent(StudentModel student) {
    Future.delayed(Duration(seconds: 1), () {
      emit(
        state.copyWith(
          lstStudents: state.lstStudents..add(student),
          isloading: true,
        ),
      );
    });
  }

  void deleteStudent(int index) {
    emit(state.copyWith(isloading: true));

    Future.delayed(Duration(seconds: 1), () {
      emit(
        state.copyWith(
          lstStudents: state.lstStudents..removeAt(index),
          isloading: false,
        ),
      );
    });
  }
}

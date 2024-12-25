import 'package:bloc_test/model/student_model.dart';
import 'package:bloc_test/state/student.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit() : super(StudentState.initial());

  // Add a student with the loading indicator
  void addStudent(StudentModel student) {
    Future.delayed(Duration(seconds: 1), () {
      // Create a new list by copying the existing list and adding the new student
      emit(
        state.copyWith(
          lstStudents: List.from(state.lstStudents)
            ..add(student), // Create a new list with the added student
          isloading: false, // Turn off loading after the operation
        ),
      );
    });

    // Set loading to true before the delayed operation
    emit(state.copyWith(isloading: true));
  }

  // Delete a student with the loading indicator
  void deleteStudent(int index) {
    emit(state.copyWith(
        isloading: true)); // Set loading to true before the operation

    Future.delayed(Duration(seconds: 1), () {
      // Create a new list by copying the existing list and removing the student at the specified index
      emit(
        state.copyWith(
          lstStudents: List.from(state.lstStudents)
            ..removeAt(index), // Create a new list after removing the student
          isloading: false, // Turn off loading after the operation
        ),
      );
    });
  }
}

import 'package:bloc_test/model/student_model.dart';

class StudentState {
  final List<StudentModel> lstStudents;
  final bool isloading;

  const StudentState({
    required this.lstStudents,
    required this.isloading,
  });

  factory StudentState.initial() {
    return StudentState(
      lstStudents: [],
      isloading: false,
    );
  }

  StudentState copyWith({
    List<StudentModel>? lstStudents,
    bool? isloading,
  }) {
    return StudentState(
      lstStudents: lstStudents ?? this.lstStudents,
      isloading: isloading ?? this.isloading,
    );
  }
}


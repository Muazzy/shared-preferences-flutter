import 'dart:convert';

class Student {
  final String rollNo;
  final String name;
  final int age;
  final String section;

  Student({
    required this.age,
    required this.rollNo,
    required this.name,
    required this.section,
  });

  factory Student.fromJson(Map<String, dynamic> jsonData) => Student(
        age: jsonData['age'],
        rollNo: jsonData['rollNo'],
        name: jsonData['name'],
        section: jsonData['section'],
      );

  static Map<String, dynamic> toMap(Student student) => {
        'rollNo': student.rollNo,
        'name': student.name,
        'age': student.age,
        'section': student.section,
      };

  // static String encode(List<Student> student) => json.encode(
  //   student.map((e) => Student.tp

  // );

  static String encode(List<Student> students) => json.encode(
        students
            .map<Map<String, dynamic>>((student) => Student.toMap(student))
            .toList(),
      );

  static List<Student> decode(String students) =>
      (json.decode(students) as List<dynamic>)
          .map<Student>((e) => Student.fromJson(e))
          .toList();
}

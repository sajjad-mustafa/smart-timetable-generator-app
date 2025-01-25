// models/class.dart
class SchoolClass {
  String id;
  String name;

  SchoolClass({required this.id, required this.name});

  factory SchoolClass.fromFirestore(Map<String, dynamic> data, String id) {
    return SchoolClass(
      id: id,
      name: data['name'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
    };
  }
}

// Similarly create models for Course, Lecturer, and Timetable

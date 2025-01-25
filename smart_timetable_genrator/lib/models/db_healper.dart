// data/database_helper.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:school_admin_panel/models/class.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  final CollectionReference classesRef = FirebaseFirestore.instance.collection('classes');

  DatabaseHelper._init();

  Future<void> createClass(SchoolClass schoolClass) async {
    await classesRef.add(schoolClass.toFirestore());
  }

  Future<List<SchoolClass>> readAllClasses() async {
    final snapshot = await classesRef.get();
    return snapshot.docs.map((doc) => SchoolClass.fromFirestore(doc.data() as Map<String, dynamic>, doc.id)).toList();
  }

  Future<void> updateClass(SchoolClass schoolClass) async {
    await classesRef.doc(schoolClass.id).update(schoolClass.toFirestore());
  }

  Future<void> deleteClass(String id) async {
    await classesRef.doc(id).delete();
  }
}

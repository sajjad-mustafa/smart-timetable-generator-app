// main.dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/manage_classes.dart';
import 'screens/manage_courses.dart';
import 'screens/manage_lecturers.dart';
import 'screens/generate_timetable.dart';
import 'screens/settings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SchoolAdminPanelApp());
}

class SchoolAdminPanelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'School Admin Panel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AdminDashboard(),
    );
  }
}

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Manage Classes'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ManageClassesScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Manage Courses'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ManageCoursesScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Manage Lecturers'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ManageLecturersScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Generate Timetable'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GenerateTimetableScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

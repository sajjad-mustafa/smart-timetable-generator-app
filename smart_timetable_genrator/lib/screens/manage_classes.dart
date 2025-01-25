// screens/manage_classes.dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:school_admin_panel/models/class.dart';

class ManageClassesScreen extends StatelessWidget {
 // final CollectionReference classesRef = FirebaseFirestore.instance.collection('classes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Classes'),
      ),
      body: StreamBuilder(
        stream: classesRef.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final classes = snapshot.data!.docs.map((doc) {
            return SchoolClass.fromFirestore(doc.data() as Map<String, dynamic>, doc.id);
          }).toList();

          return ListView.builder(
            itemCount: classes.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(classes[index].name),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        // Implement edit functionality
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () async {
                        await classesRef.doc(classes[index].id).delete();
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement add class functionality
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

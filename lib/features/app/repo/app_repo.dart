import 'package:cloud_firestore/cloud_firestore.dart';

class TaskRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> addTask(Map<String, dynamic> taskData) async {
    try {
      await _firestore.collection('tasks').add(taskData);
    } catch (e) {
      throw Exception('Failed to add task: $e');
    }
  }

  Stream<List<Map<String, dynamic>>> getTasks() {
    return _firestore.collection('tasks').snapshots().map(
      (snapshot) {
        return snapshot.docs.map((doc) {
          return {
            'id': doc.id, 
            ...doc.data(),
          };
        }).toList();
      },
    );
  }

  Future<void> deleteTask(String taskId) async {
    try {
      await _firestore.collection('tasks').doc(taskId).delete();
    } catch (e) {
      throw Exception('Failed to delete task: $e');
    }
  }
}

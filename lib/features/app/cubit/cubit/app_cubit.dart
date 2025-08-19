import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/core/imports/imports.dart';

class TaskCubit extends Cubit<TaskState> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  TaskCubit() : super(TaskInitial());

  void getTasks() {
    try {
      emit(TaskLoading());

      _firestore.collection('tasks').snapshots().listen((snapshot) {
        final tasks = snapshot.docs.map((doc) {
          return {
            'id': doc.id,
            ...doc.data(),
          };
        }).toList();

        emit(TaskLoaded(tasks));
      });
    } catch (e) {
      emit(TaskError(e.toString()));
    }
  }

  Future<void> addTask(Map<String, dynamic> taskData) async {
    try {
      await _firestore.collection('tasks').add(taskData);
    } catch (e) {
      emit(TaskError("Error adding task: $e"));
    }
  }

 
  Future<void> deleteTask(String taskId) async {
    try {
      await _firestore.collection('tasks').doc(taskId).delete();
    } catch (e) {
      emit(TaskError("Error deleting task: $e"));
    }
  }
}
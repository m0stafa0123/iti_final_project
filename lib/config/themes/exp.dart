import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/imports/imports.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Background(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              "Your Tasks",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),

            // مثال لمهام
            taskCard("Finish Flutter Project", "Today - High Priority"),
            taskCard("Study for Exam", "Tomorrow - Medium Priority"),
            taskCard("Workout", "Anytime - Low Priority"),
          ],
          
        ),
        
      ),

    );
  }

  Widget taskCard(String title, String subtitle) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.check_circle_outline),
      ),
    );
  }
}

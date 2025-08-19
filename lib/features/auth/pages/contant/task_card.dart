import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/imports/imports.dart';

enum TaskStatus {
  important,
  normal,
   low,
}

class TaskCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final TaskStatus status;

  const TaskCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 5,
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: Icon(
          AppIcons.checkCircle,
          color: status == TaskStatus.important
              ? AppColors.impoTask
              : status == TaskStatus.normal
                  ? AppColors.medTask
                  : status == TaskStatus.low
                      ? AppColors.lowTask
                      : Colors.grey,
        ),
         
      ),
    );
  }
}

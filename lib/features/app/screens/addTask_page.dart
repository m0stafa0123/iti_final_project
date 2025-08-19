import 'package:flutter_application_1/core/imports/imports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController dayController = TextEditingController();

  String? selectedStatus;

  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      dateController.text = "${picked.year}-${picked.month}-${picked.day}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Task")),
      body: Background(
        child: Container(
          padding: const EdgeInsets.only(top: 60, left: 30, right: 30),
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Textfield(
                  hintText: AppString.toDoTitle,
                  controller: titleController,
                  validator: AppValidators.validateTasks,
                ),
                SizedBox(height: 35),
                Textfield(
                  hintText: AppString.toDoDescription,
                  controller: descriptionController,
                ),
                const SizedBox(height: 35),
                TextFormField(
                  controller: dateController,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: AppString.toDoTaskDeadlineDate,
                    prefixIcon: Icon(Icons.calendar_today),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 198, 188, 188),
                  ),
                  onTap: _pickDate,
                ),
                SizedBox(height: 35),
                Textfield(
                  hintText: AppString.toDoTaskCategory,
                  controller: categoryController,
                  validator: AppValidators.validateTasks,
                ),
                SizedBox(height: 35),
                Textfield(
                  hintText: AppString.toDoTaskDay,
                  controller: dayController,
                  validator: AppValidators.validateTasks,
                ),
                SizedBox(height: 35),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.impoTask,
                      ),
                      onPressed: () {
                        setState(() {
                          selectedStatus = "important";
                        });
                      },
                      child: const Text("important"),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.medTask,
                      ),
                      onPressed: () {
                        setState(() {
                          selectedStatus = "medium";
                        });
                      },
                      child: const Text("med"),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.lowTask,
                      ),
                      onPressed: () {
                        setState(() {
                          selectedStatus = "low";
                        });
                      },
                      child: const Text("low"),
                    ),
                  ],
                ),
                SizedBox(height: 25),

                Buttom(
                  child: const Text("Add Task"),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (selectedStatus == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please select a status"),
                          ),
                        );
                        return;
                      }

                      final taskData = {
                        'title': titleController.text,
                        'description': descriptionController.text,
                        'date': dateController.text,
                        'category': categoryController.text,
                        'day': dayController.text,
                        'status':
                            selectedStatus, // نخزن الـ status اللي المستخدم اختاره
                      };

                      context.read<TaskCubit>().addTask(taskData);

                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

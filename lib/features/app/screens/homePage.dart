import 'package:flutter_application_1/core/imports/imports.dart';
import 'package:flutter_application_1/features/auth/pages/contant/task_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    context.read<TaskCubit>().getTasks(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppString.title)),
      body: Background(
        child: Container(
          padding: const EdgeInsets.all(25),
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<TaskCubit, TaskState>(
                    builder: (context, state) {
                      if (state is TaskLoading) {
                        return const CircularProgressIndicator();
                      } else if (state is TaskLoaded) {
                        return Column(
                          children: state.tasks.map((task) {
                            return TaskCard(
                              title: task['title'] ?? '',
                              subtitle: task['description'] ?? '',
                              status: _mapStatus(task['status']),
                            );
                          }).toList(),
                        );
                      } else if (state is TaskError) {
                        return Text("Error: ${state.message}");
                      }
                      return const Text("No tasks yet");
                    },
                  ),

                  const SizedBox(height: 20),

                  /// زرار Add Task
                  Container(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const AddTaskPage(),
                          ),
                        );
                      },
                      child: const Icon(Icons.add),
                    ),
                  ),

                  const SizedBox(height: 15),

                  Container(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                      onPressed: () {
                      },
                      child: const Icon(Icons.remove),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// يحول status من String لـ enum
  TaskStatus _mapStatus(String? status) {
    switch (status) {
      case "important":
        return TaskStatus.important;
      case "medium":
        return TaskStatus.normal;
      case "low":
        return TaskStatus.low;
      default:
        return TaskStatus.low;
    }
  }
}

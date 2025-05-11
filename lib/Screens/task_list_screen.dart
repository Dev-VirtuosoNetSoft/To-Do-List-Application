import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_application/Provider/task_provider.dart';
import 'package:to_do_application/Screens/home.dart';
import 'package:to_do_application/models/task_model.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  String _formatTime(TimeOfDay time) {
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Tasks'),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            tooltip: 'Back to Home',
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const Home()),
                (route) => false,
              );
            },
          ),
        ],
      ),
      body:
          taskProvider.tasks.isEmpty
              ? const Center(child: Text('No tasks added yet.'))
              : ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: taskProvider.tasks.length,
                itemBuilder: (context, index) {
                  final Task task = taskProvider.tasks[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(
                        task.title,
                        style: TextStyle(
                          decoration:
                              task.isCompleted
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                        ),
                      ),
                      subtitle: Text('Remind at: ${_formatTime(task.time)}'),
                      trailing: Checkbox(
                        value: task.isCompleted,
                        onChanged: (_) {
                          taskProvider.toggleCompletion(index);
                        },
                      ),
                    ),
                  );
                },
              ),
    );
  }
}

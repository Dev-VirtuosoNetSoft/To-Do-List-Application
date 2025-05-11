import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_application/Provider/task_provider.dart';
import 'package:to_do_application/Screens/task_list_screen.dart';
import 'package:to_do_application/Screens/task_screen.dart';
import 'package:to_do_application/Styles/styles.dart';
import 'package:to_do_application/models/task_model.dart';

class TaskTimerScreen extends StatefulWidget {
  final String taskTitle;
  const TaskTimerScreen({super.key, required this.taskTitle});

  @override
  State<TaskTimerScreen> createState() => _TaskTimerScreenState();
}

class _TaskTimerScreenState extends State<TaskTimerScreen> {
  TimeOfDay? _selectedTime;

  void _pickTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });

      //created Task and passing the value to provider
      final newTask = Task(title: widget.taskTitle, time: picked);
      Provider.of<TaskProvider>(context, listen: false).addTask(newTask);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const TaskListScreen()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    // Implementing the Auto-trigger for time picker!
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pickTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select Time",
          style: Styles.subTitleStyling(color: Colors.white),
        ),
        backgroundColor: Styles.backgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const TaskScreen()),
              (route) => false,
            );
          },
        ),
      ),
      backgroundColor: Styles.backgroundColor,
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

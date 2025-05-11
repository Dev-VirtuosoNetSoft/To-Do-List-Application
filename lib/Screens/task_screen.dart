import 'package:flutter/material.dart';
import 'package:to_do_application/Screens/home.dart';
import 'package:to_do_application/Styles/styles.dart';
import 'package:to_do_application/Widget/task_timer_timer.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final TextEditingController _titleController = TextEditingController();

  void _goToTimerScreen() {
    if (_titleController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a task title')),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) =>
                TaskTimerScreen(taskTitle: _titleController.text.trim()),
      ),
    );
  }

  Widget _buildSuggestionChip(String suggestion) {
    return ActionChip(
      label: Text(suggestion, style: const TextStyle(color: Colors.white)),
      backgroundColor: Styles.backgroundColor,
      onPressed: () {
        setState(() {
          _titleController.text = suggestion;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.backgroundColor,
      appBar: AppBar(
        backgroundColor: Styles.backgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const Home()),
              (route) => false,
            );
          },
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Enter Task Title',
              style: Styles.titleStyling(color: Colors.white),
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: _titleController,
                style: TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Task Title',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            const SizedBox(height: 15),
            Row(
              children: [
                Align(
                  child: Text(
                    'Suggestions:',
                    style: Styles.fieldHeadingStyling(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Column(
              spacing: 10,
              children: [
                _buildSuggestionChip('Study'),
                _buildSuggestionChip('Go to Movie'),
                _buildSuggestionChip('Read Book'),
                _buildSuggestionChip('Exercise'),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                  onPressed: _goToTimerScreen,
                  child: Text(
                    'Next',
                    style: Styles.subTitleStyling(color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

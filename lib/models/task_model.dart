import 'package:flutter/material.dart';

class Task {
  final String title;
  final TimeOfDay time;
  bool isCompleted;

  Task({
    required this.title,
    required this.time,
    this.isCompleted = false,
  });
}

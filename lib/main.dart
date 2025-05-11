import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_application/Provider/task_provider.dart';
import 'package:to_do_application/Screens/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => TaskProvider())],
      child: const MaterialApp(debugShowCheckedModeBanner: false, home: Home()),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_application/Provider/task_provider.dart';
import 'package:to_do_application/Styles/splash_screen.dart';
import 'package:to_do_application/Styles/styles.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => TaskProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        color: Styles.backgroundColor,
        home: SplashScreen(),
      ),
    );
  }
}

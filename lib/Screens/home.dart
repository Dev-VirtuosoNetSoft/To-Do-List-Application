import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:to_do_application/Screens/task_screen.dart';
import 'package:to_do_application/Styles/styles.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Styles.backgroundColor),
      backgroundColor: Styles.backgroundColor, // to be styled as dynamic
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi there!",
                style: Styles.titleStyling(color: Styles.textColor),
              ),
              SizedBox(height: 5),
              Text(
                "What do you need to\naccomplish today?",
                style: Styles.titleStyling(),
              ),
              //add animation
              Center(
                child: SizedBox(
                  height: 350,
                  child: Lottie.asset('assests/animation/tetris.json'),
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => TaskScreen()),
                      );
                    },
                    child: Text(
                      'Lets Move Ahead',
                      style: Styles.subTitleStyling(color: Colors.black),
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
}

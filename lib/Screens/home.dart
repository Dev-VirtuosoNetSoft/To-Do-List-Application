import 'package:flutter/material.dart';
import 'package:to_do_application/Screens/task_scree.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple, // to be styled as dynamic
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hi there!"),
              SizedBox(height: 5),
              Text("What do you need to\naccomplish today?"),
              //to be styled
              Spacer(),

              //add animation
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate or handle logic here
                  },
                  child: Text('Add animation tetris '),
                ),
              ),
              Spacer(),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => TaskScreen()),
                    );
                  },
                  child: Text('Lets Move Ahead'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

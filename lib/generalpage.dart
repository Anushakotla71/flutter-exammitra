import 'package:flutter/material.dart';
import 'package:project_1/dailyquiz.dart';

class GeneralAwarenessPage extends StatelessWidget {
  const GeneralAwarenessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("General Awareness"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Dailyquiz()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          ),
          child: const Text("Start Daily Quiz", style: TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}

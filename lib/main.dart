import 'package:flutter/material.dart';
import 'package:june/june.dart';
import 'mood_vm.dart';

void main() {
  runApp(const MoodApp());
}

class MoodApp extends StatelessWidget {
  const MoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Mood Tracker")),
        body: Center(
          child: JuneBuilder(
            () => MoodVM(),
            builder: (vm) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(vm.emoji, style: const TextStyle(fontSize: 80)),
                Text("You feel ${vm.mood}", style: const TextStyle(fontSize: 24)),
                const SizedBox(height: 30),
                Wrap(
                  spacing: 10,
                  children: [
                    ElevatedButton(
                      onPressed: () => vm.setMood("Happy", "😊"),
                      child: const Text("Happy"),
                    ),
                    ElevatedButton(
                      onPressed: () => vm.setMood("Sad", "😢"),
                      child: const Text("Sad"),
                    ),
                    ElevatedButton(
                      onPressed: () => vm.setMood("Neutral", "😐"),
                      child: const Text("Neutral"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

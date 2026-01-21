import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      home: const QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int index = 0;
  int score = 0;

  final questions = [
    {
      'q': 'What is Flutter?',
      'a': ['Language', 'Framework', 'Game', 'OS'],
      'c': 1
    },
    {
      'q': 'Flutter uses?',
      'a': ['Java', 'Dart', 'C++', 'Python'],
      'c': 1
    },
    {
      'q': 'Flutter by?',
      'a': ['Apple', 'Google', 'Meta', 'Microsoft'],
      'c': 1
    },
  ];

  void answer(int i) {
    if (i == questions[index]['c']) score++;

    setState(() {
      index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (index >= questions.length) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Score: $score', style: const TextStyle(fontSize: 30)),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    index = 0;
                    score = 0;
                  });
                },
                child: const Text('Restart'),
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Quiz')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              questions[index]['q'].toString(),
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 20),
            ...List.generate(4, (i) {
              return ElevatedButton(
                onPressed: () => answer(i),
                child: Text((questions[index]['a'] as List)[i].toString()),
              );
            })
          ],
        ),
      ),
    );
  }
}

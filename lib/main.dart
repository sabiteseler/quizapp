import 'package:flutter/material.dart';
import 'package:intro/questions.dart';
import 'package:intro/result_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Questions App',
      routes: {
        '/questionScreen': (context) => const QuestionsScreen(),
        '/result': (context) => const ResultPage(),
      },
      initialRoute: '/questionScreen',
    );
  }
}

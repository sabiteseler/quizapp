import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final int? correct;
  final int? wrong;
  const ResultPage({
    Key? key,
    this.correct,
    this.wrong,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("doğru " + correct!.toString()),
            Text("yanlış " + wrong!.toString()),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

/// 07. 초대 시각
class QuestionTimePage extends StatelessWidget {
  static const questionPageNumber = 7;

  const QuestionTimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('QuestionTimePage'),
        ),
        body: Container(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/question/${questionPageNumber + 1}');
          },
          child: const Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}

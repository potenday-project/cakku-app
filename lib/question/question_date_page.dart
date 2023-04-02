import 'package:flutter/material.dart';

/// 06. 초대 날짜
class QuestionDatePage extends StatelessWidget {
  static const questionPageNumber = 6;
  const QuestionDatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('QuestionDatePage'),
        ),
        body: Container(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/question/${questionPageNumber + 1}');
          },
          child: const Icon(Icons.arrow_forward),
        )
      ),
    );
  }

}

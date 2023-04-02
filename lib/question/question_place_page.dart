import 'package:flutter/material.dart';

/// 08. 초대 장소
class QuestionPlacePage extends StatelessWidget {
  static const questionPageNumber = 8;
  const QuestionPlacePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('QuestionPlacePage'),
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

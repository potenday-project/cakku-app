import 'package:flutter/material.dart';

/// 09. 초대 설명
class QuestionDescriptionPage extends StatelessWidget {
  const QuestionDescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('QuestionDescriptionPage'),
        ),
        body: Container(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/question/loading');
          },
          child: const Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}

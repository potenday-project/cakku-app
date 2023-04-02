import 'package:cakku_app/cakku_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../domain/invitation_builder.dart';

/// 01. 이름 (필수)
class QuestionNamePage extends StatelessWidget {
  static const questionPageNumber = 1;
  QuestionNamePage({super.key});
  
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final builder = Provider.of<InvitationBuilder>(context);
    var userName = builder.data.userName;
    print('userName: $userName');
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40),
          Text('START'),
          SizedBox(height: 4),
          Text('지금부터 님만의 카드를 만기 위해\n질문 8개를 여쭤볼 예정이에요.'),
          SizedBox(height: 20),
          Text('반가워요. ☺️\n먼저 이름을 알려줄 수 있나요?'),
          SizedBox(height: 40),
          TextFormField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: '이름을 입력해주세요.',
            ),
          ),
        ],
      ),
      floatingActionButton: CakkuFloatingActionButton(
        onPressed: () {
          builder.data.userName = _controller.text;
          Navigator.pushNamed(context, '/question/${questionPageNumber + 1}');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

}

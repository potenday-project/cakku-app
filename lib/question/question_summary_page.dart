import 'package:cakku_app/domain/invitation_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../cakku_colors.dart';

/// 04. 초대 제목
class QuestionSummaryPage extends StatelessWidget {
  static const questionPageNumber = 4;

  const QuestionSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final builder = Provider.of<InvitationBuilder>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 40),
            Text(
              'STEP 3',
              style: TextStyle(
                color: CakkuColors.primary,
              ),
            ),
            SizedBox(height: 20),
            Text('${builder.invitationDetailTypeName}! \n한 줄로 요약한다면?'),
            SizedBox(height: 40),
            TextFormField(
              decoration: const InputDecoration(
                hintText: '예시) 카꾸네 집들이, 카꾸의 생일파티',
              ),
              onChanged: (value) {
                builder.data.summary = value;
              },
            ),
          ],
        ),
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

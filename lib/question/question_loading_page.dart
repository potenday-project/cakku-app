import 'package:cakku_app/domain/invitation_builder.dart';
import 'package:cakku_app/domain/result_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../api/cakku_api_client.dart';
import '../api/invitation_response.dart';

/// API 호출동안 로딩!
class QuestionLoadingPage extends StatelessWidget {
  final cakkuApiClient = CakkuApiClient();

  QuestionLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final builder = Provider.of<InvitationBuilder>(context);
    final resultBuilder = Provider.of<ResultBuilder>(context);
    return FutureBuilder<InvitationResponse>(
      future: cakkuApiClient.createInvitation(builder.data.build()),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
          print(snapshot.stackTrace);
          return SafeArea(
            child: Scaffold(
              body: Center(
                child: Text('😭\n카드를 만드는 중에\n오류가 발생했어요!'),
              ),
            ),
          );
        } else {
          if (snapshot.hasData) {
            Future.delayed(const Duration(seconds: 1), () {
              resultBuilder.update(snapshot.data!.cardId);
              Navigator.of(context).pushNamedAndRemoveUntil(
                '/result',
                (route) => false,
              );
            });
          }
          return SafeArea(
            child: Scaffold(
              body: Center(
                child: Text(
                    '💌\n입력하신 정보로\n${builder.data.userName}님의 카드를\n만드는 중이에요!'),
              ),
            ),
          );
        }
      },
    );
  }
}

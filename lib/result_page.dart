import 'package:cakku_app/api/card_response.dart';
import 'package:cakku_app/domain/invitation_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'api/cakku_api_client.dart';
import 'domain/result_builder.dart';

class ResultPage extends StatelessWidget {
  final cakkuApiClient = CakkuApiClient();
  ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final invitationBuilder = Provider.of<InvitationBuilder>(context);
    final resultBuilder = Provider.of<ResultBuilder>(context);
    return FutureBuilder(
      future: cakkuApiClient.getCard(resultBuilder.cardId!),
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
            return _buildPage(context, snapshot.data!);
          }
          return SafeArea(
            child: Scaffold(
              body: Center(
                child: Text(
                    '💌\n입력하신 정보로\n${invitationBuilder.data.userName}님의 카드를\n만드는 중이에요!'),
              ),
            ),
          );
        }
      }
    );
  }

  Widget _buildPage(
      BuildContext context,
      CardResponse cardResponse,
  ) {
    final invitationBuilder = Provider.of<InvitationBuilder>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text('💌'),
            Text('${invitationBuilder.data.userName} 님, 카드가 완성됐어요 !'),
            Text('💡 TIP ! 이미지를 꾸욱 누르면 휴대폰에 저장할 수 있어요'),
            Center(
              child: GestureDetector(
                onLongPress: () {
                  // 앨범에 저장
                },
                child: Image.network(
                  cakkuApiClient.resolveFileUrl(cardResponse.fileId),
                  width: 300,
                  height: 300,
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  invitationBuilder.reset();
                  Navigator.pushReplacementNamed(context, '/start');
                },
                child: const Text('새로운 초대장 만들기'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

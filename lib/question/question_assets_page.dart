import 'package:cakku_app/api/cakku_api_client.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../api/card_template_item_response.dart';
import '../cakku_colors.dart';
import '../cakku_floating_action_button.dart';
import '../domain/invitation_builder.dart';

/// 05. 테마별 애셋 선택
class QuestionAssetsPage extends StatefulWidget {
  final questionPageNumber = 5;
  final cakkuApiClient = CakkuApiClient();

  QuestionAssetsPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuestionAssetsPageState();
  }
}

class _QuestionAssetsPageState extends State<QuestionAssetsPage> {
  @override
  Widget build(BuildContext context) {
    final builder = Provider.of<InvitationBuilder>(context);
    return FutureBuilder(
      future: widget.cakkuApiClient.getCardTemplateItems(
        builder.data.invitationDetailTypeId,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _buildPage(context, snapshot.data!);
        } else if (snapshot.hasError) {
          print('error: ${snapshot.error}');
          print('stacktrace: ${snapshot.stackTrace}');
          return const Center(child: Text('Error'));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _buildPage(
    BuildContext context,
    List<CardTemplateItemResponse> items,
  ) {
    final builder = Provider.of<InvitationBuilder>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 40),
            Text(
              'STEP 4',
              style: TextStyle(
                color: CakkuColors.primary,
              ),
            ),
            SizedBox(height: 20),
            Text('${builder.data.summary} 하면\n어떤 것들이 떠오르시나요?'),
            SizedBox(height: 8),
            Text(
              '최대 3개까지 선택하실 수 있어요!',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(height: 24),
            Expanded(
              child: GridView.count(
                  crossAxisCount: 3,
                  children: items.map((item) {
                    return GestureDetector(
                      onTap: () {
                        if (builder.data.cardTemplateItemIds
                            .contains(item.cardTemplateItemId)) {
                          builder.data.cardTemplateItemIds
                              .remove(item.cardTemplateItemId);
                        } else {
                          if (builder.data.cardTemplateItemIds.length < 3) {
                            builder.data.cardTemplateItemIds
                                .add(item.cardTemplateItemId);
                          }
                        }
                        setState(() {});
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: builder.data.cardTemplateItemIds
                                    .contains(item.cardTemplateItemId)
                                ? CakkuColors.primary
                                : Colors.grey,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(item.emoji),
                            SizedBox(height: 8),
                            Text(item.name),
                          ],
                        ),
                      ),
                    );
                  }).toList()),
            ),
          ],
        ),
        floatingActionButton: CakkuFloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/question/loading');
            // FIXME: 날짜, 시간, 장소, 목적, 구현필요
            // Navigator.pushNamed(context, '/question/${widget.questionPageNumber + 1}');
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}

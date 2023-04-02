import 'package:cakku_app/api/cakku_api_client.dart';
import 'package:cakku_app/domain/invitation_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../api/invitation_detail_type_response.dart';
import '../cakku_colors.dart';
import '../cakku_floating_action_button.dart';

/// 03. 초대 분위기/컨셉
class QuestionConceptPage extends StatefulWidget {
  final questionPageNumber = 3;
  final cakkuApiClient = CakkuApiClient();

  QuestionConceptPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuestionConceptPageState();
  }
}

class _QuestionConceptPageState extends State<QuestionConceptPage> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final builder = Provider.of<InvitationBuilder>(context);
    return FutureBuilder<List<InvitationDetailTypeResponse>>(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _buildPage(context, snapshot.data!);
        } else if (snapshot.hasError) {
          print(snapshot.stackTrace);
          return const Center(child: Text('Error'));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
      future: widget.cakkuApiClient.getInvitationDetailTypes(
        invitationTypeIndex: builder.data.invitationTypeIndex,
      ),
    );
  }

  Widget _buildPage(
      BuildContext context,
      List<InvitationDetailTypeResponse> invitationDetailTypeResponses,
  ) {
    final builder = Provider.of<InvitationBuilder>(context);
    final invitationTypeName = builder.invitationTypeName;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text('STEP 2'),
            Text('$invitationTypeName에 대한\b카드를 만들고 싶으시군요!\n더 자세히 알려주실 수 있나요?'),
            Expanded(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: invitationDetailTypeResponses.length,
                itemBuilder: (context, index) {
                  return _getToggleButtonItem(context, index, invitationDetailTypeResponses[index]);
                },
              ),
            ),
          ],
        ),
        floatingActionButton: CakkuFloatingActionButton(
          onPressed: () {
            builder.data.invitationDetailTypeId = invitationDetailTypeResponses[selectedIndex].invitationDetailTypeId;
            builder.invitationDetailTypeName = invitationDetailTypeResponses[selectedIndex].name;
            Navigator.pushNamed(context, '/question/${widget.questionPageNumber + 1}');
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  Widget _getToggleButtonItem(
      BuildContext context,
      int index,
      InvitationDetailTypeResponse invitationDetailTypeResponse,
  ) {
    final isSelected = index == selectedIndex;
    return GestureDetector(
      onTapUp: (_) {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              shape: BoxShape.rectangle,
              border: Border.all(
                color: CakkuColors.grey,
                width: 1,
              ),
              color: isSelected ? CakkuColors.primary : Colors.white,
            ),
            width: MediaQuery.of(context).size.width - 32,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: Center(
                child: Text('${invitationDetailTypeResponse.emoji} ${invitationDetailTypeResponse.name}'),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

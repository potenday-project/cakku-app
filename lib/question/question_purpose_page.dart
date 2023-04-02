import 'package:cakku_app/domain/invitation_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../cakku_colors.dart';
import '../cakku_floating_action_button.dart';

/// 02. 초대 목적
class QuestionPurposePage extends StatefulWidget {
  final questionPageNumber = 2;

  const QuestionPurposePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return QuestionPurposePageState();
  }
}

class QuestionPurposePageState extends State<QuestionPurposePage> {
  late List<InvitationTypeState> invitationTypeStates;

  @override
  void initState() {
    super.initState();
    invitationTypeStates = [
      InvitationTypeState('🗓️캐쥬얼한 약속', 0, false),
      InvitationTypeState('🎉기념 파티', 1, false),
      InvitationTypeState('🔥대결', 2, false),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final builder = Provider.of<InvitationBuilder>(context);
    print('builder: $builder');
    final userName = builder.data.userName!;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 40),
            Text('STEP 1'),
            SizedBox(height: 20),
            Text('$userName님의 카드에\n어떤 내용을 담을까요?'),
            SizedBox(height: 40),
            Expanded(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: invitationTypeStates.length,
                itemBuilder: (context, index) {
                  return _getToggleButtonItem(context, index);
                },
              ),
            ),
          ],
        ),
        floatingActionButton: CakkuFloatingActionButton(
          onPressed: () {
            final invitationTypeState =
                invitationTypeStates.firstWhere((e) => e.isSelected);
            builder.updateInvitationTypeIndex(invitationTypeState.index);
            builder.invitationTypeName = invitationTypeState.label;
            Navigator.pushNamed(
                context, '/question/${widget.questionPageNumber + 1}');
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  Widget _getToggleButtonItem(BuildContext context, int index) {
    return GestureDetector(
      onTapUp: (_) {
        setState(() {
          invitationTypeStates = invitationTypeStates.map((e) {
            if (e.index == index) {
              return e.copyWith(isSelected: !e.isSelected);
            } else {
              return e.copyWith(isSelected: false);
            }
          }).toList();
          print(invitationTypeStates);
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
              color: invitationTypeStates[index].isSelected
                  ? CakkuColors.primary
                  : Colors.white,
            ),
            width: MediaQuery.of(context).size.width - 32,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: Center(child: Text(invitationTypeStates[index].label)),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class InvitationTypeState {
  final String label;
  final int index;
  final bool isSelected;

  InvitationTypeState(this.label, this.index, this.isSelected);

  @override
  String toString() {
    return 'InvitationTypeState{label: $label, index: $index, isSelected: $isSelected}';
  }

  InvitationTypeState copyWith({
    String? label,
    int? index,
    bool? isSelected,
  }) {
    return InvitationTypeState(
      label ?? this.label,
      index ?? this.index,
      isSelected ?? this.isSelected,
    );
  }
}

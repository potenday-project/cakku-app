import 'package:flutter/foundation.dart';

import 'invitation_request_builder.dart';

class InvitationBuilder with ChangeNotifier {
  final InvitationRequestBuilder _data = InvitationRequestBuilder();
  String? invitationTypeName;
  String? invitationDetailTypeName;

  InvitationRequestBuilder get data => _data;

  void updateUserName(String userName) {
    _data.userName = userName;
    notifyListeners();
  }

  void updateInvitationTypeIndex(int invitationTypeIndex) {
    _data.invitationTypeIndex = invitationTypeIndex;
    notifyListeners();
  }

  void updateInvitationDetailTypeId(String invitationDetailTypeId) {
    _data.invitationDetailTypeId = invitationDetailTypeId;
    notifyListeners();
  }

  void updateSummary(String summary) {
    _data.summary = summary;
    notifyListeners();
  }

  void updateDescription(String description) {
    _data.description = description;
    notifyListeners();
  }

  void updateDate(DateTime date) {
    _data.date = date;
    notifyListeners();
  }

  void updateTime(DateTime time) {
    _data.time = time;
    notifyListeners();
  }

  void updatePlace(String place) {
    _data.place = place;
    notifyListeners();
  }

  void updateCardTemplateItemsIds(List<String> cardTemplateItemsIds) {
    _data.cardTemplateItemIds = cardTemplateItemsIds;
    notifyListeners();
  }

  void reset() {
    _data.reset();
    notifyListeners();
  }

  @override
  String toString() {
    return 'InvitationBuilder{_data: $_data}';
  }
}

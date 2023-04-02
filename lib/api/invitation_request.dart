import 'package:intl/intl.dart';

class InvitationRequest {
  String userName;
  int invitationTypeIndex;
  String invitationDetailTypeId;
  String summary;
  String description;
  DateTime? date;
  DateTime? time;
  String? place;
  List<String> cardTemplateItemIds;

  InvitationRequest(
      this.userName,
      this.invitationTypeIndex,
      this.invitationDetailTypeId,
      this.summary,
      this.description,
      this.date,
      this.time,
      this.place,
      this.cardTemplateItemIds);

  InvitationRequest.fromJson(Map<String, dynamic> json)
      : userName = json['userName'],
        invitationTypeIndex = json['invitationTypeIndex'],
        invitationDetailTypeId = json['invitationDetailTypeId'],
        summary = json['summary'],
        description = json['description'],
        date = json['date'],
        time = json['time'],
        place = json['place'],
        cardTemplateItemIds = json['cardTemplateItemIds'];

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'invitationTypeIndex': invitationTypeIndex,
      'invitationDetailTypeId': invitationDetailTypeId,
      'summary': summary,
      'description': description,
      'date': date != null ? DateFormat('yyyy-MM-dd').format(date!) : null,
      'time': time != null ? DateFormat('HH:mm').format(date!) : null,
      'place': place,
      'cardTemplateItemIds': cardTemplateItemIds,
    };
  }
}

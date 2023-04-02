import 'invitation_detail_type_response.dart';

class InvitationResponse {
  String invitationId;
  String cardId;
  String userName;
  int invitationTypeIndex;
  InvitationDetailTypeResponse invitationDetailType;
  String summary;
  String description;
  DateTime? date;
  DateTime? time;
  String? place;

  InvitationResponse(
      this.invitationId,
      this.cardId,
      this.userName,
      this.invitationTypeIndex,
      this.invitationDetailType,
      this.summary,
      this.description,
      this.date,
      this.time,
      this.place);

  InvitationResponse.fromJson(Map<String, dynamic> json)
      : invitationId = json['invitationId'],
        cardId = json['cardId'], 
        userName = json['userName'],
        invitationTypeIndex = json['invitationTypeIndex'],
        invitationDetailType = InvitationDetailTypeResponse.fromJson(json['invitationDetailType']),
        summary = json['summary'],
        description = json['description'],
        date = json['date'] != null ? DateTime.parse(json['date']) : null,
        time = json['time'] != null ? DateTime.parse(json['time']) : null,
        place = json['place'];
}

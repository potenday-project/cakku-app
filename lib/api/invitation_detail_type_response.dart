class InvitationDetailTypeResponse {
  final String invitationDetailTypeId;
  final String name;
  final String emoji;

  InvitationDetailTypeResponse(
      this.invitationDetailTypeId, this.name, this.emoji);

  InvitationDetailTypeResponse.fromJson(Map<String, dynamic> json)
      : invitationDetailTypeId = json['invitationDetailTypeId'],
        name = json['name'],
        emoji = json['emoji'];
}

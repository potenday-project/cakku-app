import '../api/invitation_request.dart';

class InvitationRequestBuilder {
  String? userName;
  int? invitationTypeIndex;
  String? invitationDetailTypeId;
  String? summary;
  String? description;
  DateTime? date;
  DateTime? time;
  String? place;
  List<String> cardTemplateItemIds = [];

  InvitationRequestBuilder({
    this.userName,
    this.invitationTypeIndex,
    this.invitationDetailTypeId,
    this.summary,
    this.description,
    this.date,
    this.time,
    this.place,
  });

  InvitationRequest build() {
    return InvitationRequest(
        userName!,
        invitationTypeIndex!,
        invitationDetailTypeId!,
        summary ?? '',
        description ?? '',
        date,
        time,
        place,
        cardTemplateItemIds
    );
  }

  @override
  String toString() {
    return 'InvitationRequestBuilder{userName: $userName, invitationTypeIndex: $invitationTypeIndex, invitationDetailTypeId: $invitationDetailTypeId, summary: $summary, description: $description, date: $date, time: $time, place: $place, cardTemplateItemsIds: $cardTemplateItemIds}';
  }
}

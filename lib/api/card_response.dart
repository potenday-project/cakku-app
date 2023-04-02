class CardResponse {
  String cardId;
  String fileId;

  CardResponse(this.cardId, this.fileId);

  factory CardResponse.fromJson(Map<String, dynamic> json) {
    return CardResponse(
      json['cardId'],
      json['fileId'],
    );
  }
}

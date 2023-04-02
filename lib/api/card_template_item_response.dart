class CardTemplateItemResponse {
  String cardTemplateItemId;
  String name;
  String emoji;

  CardTemplateItemResponse(this.cardTemplateItemId, this.name, this.emoji);

  CardTemplateItemResponse.fromJson(Map<String, dynamic> json)
      : cardTemplateItemId = json['cardTemplateItemId'],
        name = json['name'],
        emoji = json['emoji'];
}

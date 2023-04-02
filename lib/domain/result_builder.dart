import 'package:flutter/foundation.dart';

class ResultBuilder with ChangeNotifier {
  String? cardId;

  update(String cardId) {
    this.cardId = cardId;
    notifyListeners();
  }
}

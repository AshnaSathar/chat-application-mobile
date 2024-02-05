import 'package:flutter/material.dart';

class ProviderClass extends ChangeNotifier {
  Map<String, List<String>> dropdownItems = {
    "Latest cricket news": [
      "Kerala cricket team",
      "Goa cricket Team",
      "Assam Cricket Team",
      "Arunachal Pradesh cricket Team"
    ],
    "Latest Football news": [
      "Manchester United",
      "Barcelona",
      "Real Madrid",
      "Chelsea",
      "Manchester City"
    ],
    "Business, Finance & Economics": [
      "Accounting",
      "Banking and Financing",
      "Business",
      "Politics and government"
    ],
    "Computer Science and Technology": [
      "Consumer IT and Technology",
      "Business IT analysis",
      "IT programming",
      "Telecommunication"
    ]
  };
  String subcategoryHeading = "Latest cricket news";
  bool changeRoomPageValue = false;
  // true =subcategory
// false= category
  Future changeRoomPageToSubCategory() async {
    changeRoomPageValue = true;
    notifyListeners();
  }

  Future changeRoomPageToCategory() async {
    changeRoomPageValue = false;
    notifyListeners();
  }
}

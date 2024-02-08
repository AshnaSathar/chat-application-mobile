import 'package:flutter/material.dart';

class ProviderClass extends ChangeNotifier {
  List sendmessage = [];
  bool isActive = false;
  Map<String, Map<String, List<String>>> dropdownItems = {
    "Latest cricket news": {
      "Indian cricket team": [
        "Thiruvananthapuram Rocks",
        "Alappuzha Club",
        "Ernakulam Cricket Association"
      ],
      "Womens cricket Team": [
        "Bengal Women's Cricket Team",
        "Goa Women's cricket team",
        "Kerala women's cricket team"
      ],
    },
    "Latest Football news": {
      "Kerala Football team": [
        "Kerala Blasters FC",
        "Manjappada Kerala Blasters Fans",
        "Silent Killers Creations"
      ],
      "Barcelona": [
        "FC Barcelona Live",
        "FC Barcelona Channel",
        "FC Barcelona Kerala Fans"
      ],
      "Real Madrid": ["Real Madrid Kerala Fans", "Real Madrid Blore Fans", "z"],
      "Chelsea": [
        "Sky sports chat",
        "Football lovers",
      ],
    },
    "Business, Finance & Economics": {
      "Accounting": ["Ripple-XRP", "Tezos", "Cardano official"],
      "Banking and Financing": [
        "Litecoin LTC",
        "Stock Discussion Hub",
        "Stock market traders"
      ],
      "Business": [
        "Business India",
        "ICO speaks",
      ],
      "Politics and government": [
        "Kerala Politics",
        "Indian National congress",
        "Communist Party in India"
      ],
    },
    "Computer Science and Technology": {
      "Consumer IT and Technology": [
        "Top tech programs kochi",
        "Gekks Talks",
        "Hacking empire"
      ],
      "IT programming": ["c/c++", "Python", "Flutter"],
    },
  };
  Future addmessage({required message}) async {
    sendmessage.add(message);
    print(message);
  }
  // String subcategoryHeading = "Latest cricket news";
  // bool changeRoomPageValue = false;
// true =subcategory
// false= category
  // Future changeRoomPageToSubCategory() async {
  //   changeRoomPageValue = true;
  //   notifyListeners();
  // }

  // Future changeRoomPageToCategory() async {
  //   changeRoomPageValue = false;
  //   notifyListeners();
  // }
}

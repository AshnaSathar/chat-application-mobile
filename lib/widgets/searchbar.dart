import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colorConstants.dart';

class SearchbarCustom extends StatelessWidget {
  const SearchbarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        style: TextStyle(),
        decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.search,
            color: ColorsUsed.secondaryIconColor,
            size: 40,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

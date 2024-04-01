import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colorConstants.dart';
import 'package:flutter_application_1/constants/textstyle.dart';

Future show_bottom_sheet({required context, required data_to_display}) async {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        height: 100,
        width: double.infinity,
        color: Colors.transparent,
        child: Center(
          child: Text(
            data_to_display,
            style: TextStyleConstants.textstyle(
              fontWeight: FontWeight.bold,
              color: ColorsUsed.primaryColor,
            ),
          ),
        ),
      );
    },
  );
}

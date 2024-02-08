import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colorConstants.dart';

class CheckboxItem {
  final String name;
  bool status;

  CheckboxItem({required this.name, this.status = false});
}

class CheckboxGroup extends StatefulWidget {
  final List<CheckboxItem> items;

  CheckboxGroup({required this.items});

  @override
  _CheckboxGroupState createState() => _CheckboxGroupState();
}

class _CheckboxGroupState extends State<CheckboxGroup> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.items.asMap().entries.map((entry) {
        CheckboxItem item = entry.value;

        return Container(
          height: MediaQuery.sizeOf(context).height * .05,
          width: MediaQuery.sizeOf(context).width * .9,
          child: CheckboxListTile(
            hoverColor: Colors.transparent,
            contentPadding: EdgeInsets.only(left: 60),
            activeColor: Colors.white,
            checkColor: ColorsUsed.primaryColor,
            side: BorderSide(color: Colors.white),
            controlAffinity: ListTileControlAffinity.leading,
            value: item.status,
            onChanged: (value) {
              setState(() {
                item.status = value!;
              });
            },
            title: Row(
              children: [
                Text(
                  item.name,
                  style:
                      TextStyle(fontSize: 14, color: ColorsUsed.secondaryColor),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

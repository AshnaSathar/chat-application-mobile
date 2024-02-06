import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/providerclass.dart';
import 'package:flutter_application_1/Views/GroupChatScreen/groupChat.dart';
import 'package:flutter_application_1/widgets/searchbar.dart';
import 'package:flutter_application_1/Views/loginPage/colorConstant.dart';
import 'package:provider/provider.dart';

class All_Rooms_Page extends StatefulWidget {
  const All_Rooms_Page({Key? key});

  @override
  State<All_Rooms_Page> createState() => _All_Rooms_PageState();
}

class _All_Rooms_PageState extends State<All_Rooms_Page> {
  Map<String?, String?> selectedValues = {};

  @override
  Widget build(BuildContext context) {
    var dropdownItems = Provider.of<ProviderClass>(context).dropdownItems;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SearchbarCustom(),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Categories",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorsUsed.bgcolor,
                ),
              ),
            ),
          ],
        ),
        Flexible(
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: ListView.builder(
                  itemCount: dropdownItems.keys.length,
                  itemBuilder: (context, index) {
                    String heading = dropdownItems.keys.elementAt(index);
                    Map<String, List<String>> subItems =
                        dropdownItems[heading] ?? {};

                    return ExpansionTile(
                      title: Text(heading),
                      children: subItems.keys.map((subItem) {
                        return ExpansionTile(
                          title: Text(subItem),
                          children: subItems[subItem]!.map((room) {
                            return ListTile(
                              title: Text(room),
                              trailing: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          GroupChat_Page(subcategory: room),
                                    ),
                                  );
                                },
                                child: Icon(Icons.chat),
                              ),
                            );
                          }).toList(),
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

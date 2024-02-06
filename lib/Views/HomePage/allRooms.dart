import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/providerclass.dart';
import 'package:flutter_application_1/Views/GroupChatScreen/groupChat.dart';
import 'package:flutter_application_1/constants/colorConstants.dart';
import 'package:flutter_application_1/widgets/searchbar.dart';
import 'package:provider/provider.dart';

class All_Rooms_Page extends StatefulWidget {
  const All_Rooms_Page({Key? key});

  @override
  State<All_Rooms_Page> createState() => _All_Rooms_PageState();
}

class _All_Rooms_PageState extends State<All_Rooms_Page> {
  List<bool> isexpanded = [];

  @override
  @override
  void initState() {
    super.initState();
    var dropdownItems =
        Provider.of<ProviderClass>(context, listen: false).dropdownItems;
    isexpanded = List.generate(
      dropdownItems.length,
      (index) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
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
                  color: ColorsUsed.secondaryColor,
                ),
              ),
            ),
          ],
        ),
        Flexible(
          child: Row(
            children: [
              Container(
                width: width,
                color: ColorsUsed.secondaryColor,
                child: ListView.builder(
                  itemCount: dropdownItems.keys.length,
                  itemBuilder: (context, index) {
                    String heading = dropdownItems.keys.elementAt(index);
                    Map<String, List<String>> subItems =
                        dropdownItems[heading] ?? {};

                    return ExpansionTile(
                      title: Text(
                        heading,
                      ),
                      textColor: isexpanded[index]
                          ? ColorsUsed.primaryColor
                          : Colors.black,
                      collapsedIconColor: isexpanded[index]
                          ? Colors.black
                          : ColorsUsed.primaryColor,
                      onExpansionChanged: (value) {
                        setState(() {
                          isexpanded[index] = value;
                        });
                      },
                      initiallyExpanded: false,
                      children: subItems.keys.map((subItem) {
                        return ExpansionTile(
                          textColor: ColorsUsed.primaryColor,
                          collapsedTextColor: Colors.black,
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
                                child: Icon(
                                  Icons.send,
                                  color: ColorsUsed.primaryColor,
                                ),
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

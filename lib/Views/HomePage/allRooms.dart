import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/providerclass.dart';
import 'package:flutter_application_1/Views/GroupChatScreen/groupChat.dart';
import 'package:flutter_application_1/constants/colorConstants.dart';
import 'package:flutter_application_1/constants/textstyle.dart';
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
                style: TextStyleConstants.textstyle(
                    color: ColorsUsed.primaryColor),
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
                        style: TextStyleConstants.textstyle(),
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
                          title: Text(
                            subItem,
                            style: TextStyleConstants.textstyle(
                              fontSize: 14,
                            ),
                          ),
                          children: subItems[subItem]!.map((room) {
                            return ListTile(
                              title: Text(
                                room,
                                style: TextStyleConstants.textstyle(
                                    fontSize: 14,
                                    color: ColorsUsed.secondaryTextColor),
                              ),
                              trailing: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          GroupChat_Page(subcategory: room),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        var begin = Offset(1.0, 0.0);
                                        var end = Offset.zero;
                                        var curve = Curves.ease;

                                        var tween = Tween(
                                                begin: begin, end: end)
                                            .chain(CurveTween(curve: curve));

                                        return SlideTransition(
                                          position: animation.drive(tween),
                                          child: child,
                                        );
                                      },
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

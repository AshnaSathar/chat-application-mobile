import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/providerclass.dart';
import 'package:flutter_application_1/Views/GroupChatScreen/groupChat.dart';
import 'package:flutter_application_1/widgets/searchbar.dart';
import 'package:provider/provider.dart';

class SubcategoryList extends StatelessWidget {
  final String subcategoryname;

  const SubcategoryList({Key? key, required this.subcategoryname})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var selectedItem;
    var dropdownItems = Provider.of<ProviderClass>(context).dropdownItems;
    selectedItem = dropdownItems[subcategoryname] ?? [];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SearchbarCustom(),
        ),
        Flexible(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              GroupChat_Page(subcategory: selectedItem[index]),
                        ));
                  },
                  child: ListTile(
                    leading: Container(
                      height: 50,
                      width: 50,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset("assets/profile.avif")),
                    ),
                    title: Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: Colors.amber,
                          size: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            selectedItem[index],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ),
                        Spacer(),
                        Text(
                          "1h",
                          style: TextStyle(color: Colors.grey, fontSize: 8),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: selectedItem.length,
          ),
        ),
      ],
    );
  }
}

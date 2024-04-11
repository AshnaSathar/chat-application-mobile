import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/friendship_provider.dart';
import 'package:flutter_application_1/constants/colorConstants.dart';
import 'package:provider/provider.dart';

class Friends_list_page extends StatefulWidget {
  const Friends_list_page({super.key});

  @override
  State<Friends_list_page> createState() => _Friends_list_pageState();
}

class _Friends_list_pageState extends State<Friends_list_page> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    try {
      var length = Provider.of<Friendship_provider>(context, listen: false)
          .friendsModel
          ?.friends
          .length;
      print("============================$length==============");
    } catch (error) {
      print("error is $error");
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsUsed.primaryColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: Column(
        children: [
          Text("Your friend list includes"),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                print(index);
                return ListTile(
                  title: Text(
                      "${Provider.of<Friendship_provider>(context, listen: false).friendsModel?.friends[index].name}"),
                  trailing: InkWell(
                      onTap: () {
                        Provider.of<Friendship_provider>(context, listen: false)
                            .remove_friend(friend_id: 22);
                      },
                      child: Icon(Icons.remove)),
                );
              },
              itemCount:
                  Provider.of<Friendship_provider>(context, listen: false)
                      .friendsModel
                      ?.friends
                      .length,
            ),
          )
        ],
      ),
    );
  }
}

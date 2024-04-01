import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/friendship_provider.dart';
import 'package:flutter_application_1/constants/colorConstants.dart';
import 'package:provider/provider.dart';

class Friends_list_page extends StatelessWidget {
  const Friends_list_page({super.key});

  @override
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
          ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("name"),
                trailing: InkWell(
                    onTap: () {
                      Provider.of<Friendship_provider>(context, listen: false)
                          .remove_friend(friend_id: 22);
                    },
                    child: Icon(Icons.remove)),
              );
            },
          )
        ],
      ),
    );
  }
}

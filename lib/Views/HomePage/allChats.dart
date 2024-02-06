import 'package:flutter/material.dart';
import 'package:flutter_application_1/Views/PersonalChatScreen/personalChatPage.dart';
import 'package:flutter_application_1/constants/colorConstants.dart';
import 'package:flutter_application_1/widgets/searchbar.dart';

class All_Chats_Page extends StatelessWidget {
  const All_Chats_Page({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
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
                          builder: (context) => Chat_Page(name: "julie"),
                        ));
                  },
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * .1,
                    child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            width: width * .13,
                            height: height * .15,
                            child: Image.asset(
                              "assets/dp1.webp",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      // ---------------------------------name
                      title: Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 15,
                            color: Colors.yellow,
                          ),
                          Text(
                            " Julie",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ColorsUsed.secondaryTextColor,
                                fontSize: 18),
                          ),
                        ],
                      ),
                      //------------------ message
                      subtitle: Text("Any plans for Today?"),
                      // -------------------time
                      trailing: Text("1h"),
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

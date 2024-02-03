import 'package:flutter/material.dart';
import 'package:flutter_application_1/Views/chatPage.dart';
import 'package:flutter_application_1/Views/chatPage/colorConstant.dart';
import 'package:flutter_application_1/widgets/searchbar.dart';

class Chat_Content_Page extends StatelessWidget {
  const Chat_Content_Page({super.key});

  @override
  Widget build(BuildContext context) {
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
                          builder: (context) => Chat_Page(),
                        ));
                  },
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * .1,
                    child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
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
                                color: ColorsUsedChat.textColor,
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

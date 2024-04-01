import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/friendship_provider.dart';
import 'package:flutter_application_1/Controller/all_users_provider.dart';
import 'package:flutter_application_1/Controller/login_provider.dart';
import 'package:flutter_application_1/constants/colorConstants.dart';
import 'package:flutter_application_1/widgets/bottomSheet.dart';
import 'package:flutter_application_1/widgets/show_model_bottom_sheet.dart';
import 'package:provider/provider.dart';

class SearchbarCustom extends StatelessWidget {
  const SearchbarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController search_controller = TextEditingController();
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          TextField(
            onChanged: (value) {
              Provider.of<All_users_provider>(context, listen: false)
                  .searchUsers(searchTerm: search_controller.text);
            },
            controller: search_controller,
            style: TextStyle(),
            decoration: InputDecoration(
              suffixIcon: Icon(
                Icons.search,
                color: ColorsUsed.secondaryIconColor,
                size: 40,
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          Consumer<All_users_provider>(
            builder: (context, provider, child) {
              if (search_controller.text.isNotEmpty &&
                  provider.usersModel != null) {
                return Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  height: MediaQuery.sizeOf(context).height * .3,
                  child: ListView.builder(
                    itemCount: provider.usersModel!.users.length,
                    itemBuilder: (context, index) {
                      final user = provider.usersModel!.users[index];
                      return ListTile(
                        trailing: IconButton(
                          onPressed: () async {
                            bool success =
                                await Provider.of<Friendship_provider>(context,
                                        listen: false)
                                    .add_friend(
                                        user_id: Provider.of<Login_provider>(
                                                context,
                                                listen: false)
                                            .user_id,
                                        token: Provider.of<Login_provider>(
                                                context,
                                                listen: false)
                                            .token,
                                        friend_uid: "21");
                            if (success == true) {
                              show_bottom_sheet(
                                  context: context,
                                  data_to_display: "Added to your friend list");
                            } else {
                              show_bottom_sheet(
                                  context: context,
                                  data_to_display:
                                      "Failed to add. Try again later");
                            }
                          },
                          icon: Icon(Icons.add),
                        ),
                        title: Text(user.userName),
                      );
                    },
                  ),
                );
              } else {
                return SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Controller/login_provider.dart';
import 'package:flutter_application_1/Views/HomePage/edit_profile_page.dart';
import 'package:flutter_application_1/constants/colorConstants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Profile_page extends StatefulWidget {
  const Profile_page({Key? key}) : super(key: key);

  @override
  _Profile_pageState createState() => _Profile_pageState();
}

class _Profile_pageState extends State<Profile_page> {
  TextEditingController input_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUsed.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2.5,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 3.5,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.black
                    //         .withOpacity(0.2), // Adjust shadow color and opacity
                    //     spreadRadius: 1, // Adjust spread radius
                    //     blurRadius: 2, // Adjust blur radius
                    //     offset: Offset(0, 3), // Adjust offset
                    //   ),
                    // ],
                    color: ColorsUsed.primaryColor,
                    border: Border(
                      bottom: BorderSide(
                        color: ColorsUsed.primaryColor,
                        width: MediaQuery.of(context).size.width * 0.01,
                      ),
                    ),
                  ),
                  child: Image.network(
                    "https://images.pexels.com/photos/7130560/pexels-photo-7130560.jpeg?cs=srgb&dl=pexels-codioful-%28formerly-gradienta%29-7130560.jpg&fm=jpg",
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  left: 0,
                  bottom: 40,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(
                                  0.5), // Adjust shadow color and opacity
                              spreadRadius: 1, // Adjust spread radius
                              blurRadius: 7, // Adjust blur radius
                              offset: Offset(0, 3), // Adjust offset
                            ),
                          ],
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: ColorsUsed.primaryColor,
                            width: MediaQuery.sizeOf(context).width * .01,
                          ),
                        ),
                        child: Stack(
                          children: [
                            CircleAvatar(
                              maxRadius: 55,
                              backgroundImage: NetworkImage(
                                "https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg",
                              ),
                            ),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: InkWell(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.camera_alt,
                                    size: 30,
                                    color: Color.fromARGB(152, 255, 253, 253),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Color.fromARGB(43, 246, 246, 246),
                  height: MediaQuery.sizeOf(context).height * .05,
                  width: MediaQuery.sizeOf(context).width * .06,
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: ColorsUsed.primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ListTile(
              title: Text(
                Provider.of<Login_provider>(context, listen: false).userName,
                style: TextStyle(
                    color: ColorsUsed.secondaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: GoogleFonts.montserrat().fontFamily),
              ),
              subtitle: InkWell(
                onTap: () {},
                child: Text(
                  "878 Friends",
                  style: TextStyle(
                      color: ColorsUsed.secondaryColor,
                      fontFamily: GoogleFonts.montserrat().fontFamily),
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  show_divider(),
                  ListTile(
                    title: Text(
                      "Bio",
                      style: TextStyle(
                          fontFamily: GoogleFonts.montserrat().fontFamily,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: ColorsUsed.secondaryColor),
                    ),
                    trailing: InkWell(
                        onTap: () {
                          show_bottom_sheet(content: "", max_character: 500);
                        },
                        child: Icon(
                          Icons.add,
                          color: ColorsUsed.secondaryColor,
                        )),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          child: Text(
                        "Type something about yourself",
                        style: TextStyle(
                            color: ColorsUsed.secondaryColor,
                            fontFamily: GoogleFonts.montserrat().fontFamily),
                      ))),
                  show_divider(),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text(
                          "Contact Details",
                          style: TextStyle(
                              fontFamily: GoogleFonts.montserrat().fontFamily,
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: ColorsUsed.secondaryColor),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      ListTile(
                        title: Text(
                          "Phone Number",
                          style: TextStyle(
                              fontFamily: GoogleFonts.montserrat().fontFamily,
                              color: ColorsUsed.secondaryColor),
                        ),
                        subtitle: Text(
                          "8848687997",
                          style: TextStyle(
                              fontFamily: GoogleFonts.montserrat().fontFamily,
                              color: ColorsUsed.secondaryColor),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          "Email id",
                          style: TextStyle(
                              fontFamily: GoogleFonts.montserrat().fontFamily,
                              color: ColorsUsed.secondaryColor),
                        ),
                        subtitle: Text(
                          "",
                          //  Provider.of<Login_provider>(context,listen: false).email_id,
                          style: TextStyle(
                              fontFamily: GoogleFonts.montserrat().fontFamily,
                              color: ColorsUsed.secondaryColor),
                        ),
                      ),
                    ],
                  ),
                  show_divider(),
                  ListTile(
                    subtitle: Text(
                      "Female",
                      style: TextStyle(
                          fontFamily: GoogleFonts.montserrat().fontFamily,
                          color: ColorsUsed.secondaryColor),
                    ),
                    title: Text(
                      "Gender",
                      style: TextStyle(
                          fontFamily: GoogleFonts.montserrat().fontFamily,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: ColorsUsed.secondaryColor),
                    ),
                  ),
                  show_divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Edit_profile(),
                            ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: ColorsUsed.secondaryColor),
                            borderRadius: BorderRadius.circular(15)),
                        height: MediaQuery.sizeOf(context).height * .07,
                        width: MediaQuery.sizeOf(context).width * .7,
                        child: Center(
                          child: Text(
                            "Edit your profile",
                            style: TextStyle(
                                color: ColorsUsed.secondaryColor,
                                fontWeight: FontWeight.w700,
                                fontFamily:
                                    GoogleFonts.montserrat().fontFamily),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future show_bottom_sheet({required content, required max_character}) async {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          children: [
            Text(
              "Hey Ashna sathar.Describe yourself.",
              style: TextStyle(
                fontFamily: GoogleFonts.montserrat().fontFamily,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                maxLength: 500,
                controller: input_controller,
                maxLines: 5,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: MediaQuery.sizeOf(context).height * .07,
                width: MediaQuery.sizeOf(context).width * .2,
                decoration: BoxDecoration(
                  color: ColorsUsed.primaryColor,
                  border: Border.all(color: ColorsUsed.primaryColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Submit",
                    style: TextStyle(
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                        color: ColorsUsed.secondaryColor),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  show_divider() {
    return Divider(
      color: Color.fromARGB(97, 90, 90, 90),
    );
  }
}

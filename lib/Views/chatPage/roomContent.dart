import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/searchbar.dart';
import 'package:flutter_application_1/Views/loginPage/colorConstant.dart';

class Rooms_Conten_Page extends StatelessWidget {
  const Rooms_Conten_Page({super.key});

  @override
  Widget build(BuildContext context) {
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
                    fontWeight: FontWeight.bold, color: ColorsUsed.bgcolor),
              ),
            ),
          ],
        ),
        Flexible(
          child: Row(
            children: [
              Container(
                width: 200,
                color: Colors.white,
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          //-------------------------------- drop down action
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Color.fromARGB(118, 198, 196, 196),
                            ),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Latest Cricket news",
                                ),
                              ),
                              Spacer(),
                              Icon(Icons.arrow_drop_down)
                            ],
                          ),
                        ),
                      ),
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

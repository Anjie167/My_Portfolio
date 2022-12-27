import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'area_info_text.dart';
import 'coding.dart';
import 'knowledges.dart';
import 'my_info.dart';
import 'skills.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance.collection("config").get(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!.docs.first;
            return Drawer(
              child: SafeArea(
                child: Column(
                  children: [
                    MyInfo(
                      profileImage: data["profileImage"] ?? "",
                      myJob: data["myJob"] ?? "",
                      myName: data["myName"],),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.all(defaultPadding),
                        child: Column(
                          children: [
                            AreaInfoText(
                              title: "Residence",
                              text: data["residence"],
                            ),
                            AreaInfoText(
                              title: "City",
                              text: data["city"],
                            ),
                            AreaInfoText(
                              title: "Age",
                              text: data["age"],
                            ),
                            Skills(),
                            SizedBox(height: defaultPadding),
                            Coding(),
                            Knowledges(),
                            Divider(),
                            SizedBox(height: defaultPadding / 2),
                            TextButton(
                              onPressed: () {
                                launchUrlString(
                                    data["CV"]);
                              },
                              child: FittedBox(
                                child: Row(
                                  children: [
                                    Text(
                                      "DOWNLOAD CV",
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .color,
                                      ),
                                    ),
                                    SizedBox(width: defaultPadding / 2),
                                    SvgPicture.asset(
                                        "assets/icons/download.svg")
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: defaultPadding),
                              color: Color(0xFF24242E),
                              child: Row(
                                children: [
                                  Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      launchUrlString(
                                          data["linkedIn"]);
                                    },
                                    icon: SvgPicture.asset(
                                        "assets/icons/linkedin.svg"),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      launchUrlString(
                                          data["github"]);
                                    },
                                    icon: SvgPicture.asset(
                                        "assets/icons/github.svg"),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      launchUrlString(
                                          data["twitter"]);
                                    },
                                    icon: SvgPicture.asset(
                                        "assets/icons/twitter.svg"),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }else{
            return SizedBox();
          }
        });
  }
}

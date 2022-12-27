import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile/components/animated_counter.dart';
import 'package:flutter_profile/responsive.dart';

import '../../../constants.dart';
import 'heigh_light.dart';

class HighLightsInfo extends StatelessWidget {
  const HighLightsInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance.collection("highlights").get(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!.docs.first;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: Responsive.isMobileLarge(context)
                  ? Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            HeighLight(
                              counter: AnimatedCounter(
                                value: data["connections"],
                                text: "+",
                              ),
                              label: "Connections",
                            ),
                            HeighLight(
                              counter: AnimatedCounter(
                                value: data["Published_apps"],
                                text: "+",
                              ),
                              label: "Published Apps",
                            ),
                          ],
                        ),
                        const SizedBox(height: defaultPadding),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            HeighLight(
                              counter: AnimatedCounter(
                                value: data["git"],
                                text: "+",
                              ),
                              label: "GitHub Projects",
                            ),
                          ],
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HeighLight(
                          counter: AnimatedCounter(
                            value: data["Published_apps"],
                            text: "+",
                          ),
                          label: "Published Apps",
                        ),
                        HeighLight(
                          counter: AnimatedCounter(
                            value: data["connections"],
                            text: "+",
                          ),
                          label: "Connections",
                        ),
                        HeighLight(
                          counter: AnimatedCounter(
                            value: data["git"],
                            text: "+",
                          ),
                          label: "GitHub Projects",
                        ),
                      ],
                    ),
            );
          } else {
            return SizedBox();
          }
        });
  }
}

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:gsoc_helper/Widgets/organisation.dart';
import 'package:gsoc_helper/models/data.dart';

class Organisations extends StatelessWidget {
  Organisations({Key? key}) : super(key: key);
  static String routeName = "/organisations";

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: OrgData.getData(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Column(
              children: [
                Text(
                  "Organisations: ",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 23,
                ),
                // Organisation(
                //     "dsfsdf",
                //     "https://lh3.googleusercontent.com/a-/AAuE7mByo0HipwBhvbu7JlskruFiiC7zXxEnMgyTDqPZ6w=k-s256",
                //     "4"),
                Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: ListView.builder(
                      itemCount: OrgData.list.length,
                      itemBuilder: (context, index) {
                        var li = OrgData.list;
                        return Organisation(li[index].name, li[index].image,
                            li[index].openings);
                      }),
                )
              ],
            );
          }
        });
  }
}

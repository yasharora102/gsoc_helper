import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:flutter/src/widgets/framework.dart';

class TechStack extends StatelessWidget {
  const TechStack({Key? key}) : super(key: key);
  static String routeName = "/tech-stack";

  Widget checkBox(
    String id,
    String text,
  ) {
    return Row(
      children: [
        RoundCheckBox(
          onTap: (selected) {
            print(selected);
          },
        ),
        SizedBox(
          width: 10,
        ),
        Text(text)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 345,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.check_box_outline_blank_outlined),
            title: Text("Tech Stack"),
          );
        },
        itemCount: 10,
      ),
    );
  }
}

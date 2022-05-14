import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: ListTile(
            leading: Container(
              child: Text("Image"),
              color: Colors.greenAccent,
            ),
            title: Text("Title"),
            subtitle: Text("OpenPost"),
          ),
        )
      ],
    );
  }
}

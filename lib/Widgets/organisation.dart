import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Organisation extends StatelessWidget {
  // const MyWidget({Key? key}) : super(key: key);

  String title;
  String imageUrl;
  String positions;

  Organisation(this.title, this.imageUrl, this.positions);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(22)),
            // color: Colors.purpleAccent,
          ),
          // color: Colors.purpleAccent,
          height: 180,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Container(
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: Colors.orange,
                  // boxShadow: const [shadow],
                ),
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                    borderRadius: BorderRadius.circular(22),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  height: 160,
                  width: 180,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(22),
                        topLeft: Radius.circular(22)),
                    child: Image(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.contain,
                      alignment: Alignment.bottomLeft,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: SizedBox(
                  height: 160,
                  width: MediaQuery.of(context).size.width - 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "$title",
                          // style: Theme.of(context).textTheme.button,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      // Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                        ),
                        child: Text('Number of Projects: $positions'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

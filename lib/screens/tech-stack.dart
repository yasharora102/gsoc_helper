import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gsoc_helper/screens/charts.dart';
import 'package:gsoc_helper/models/data.dart';
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

  // Widget getTopFive(Map<String,int> map){
  //   // var v=OrgData.getTechStack("2021", 5);
  //   return map.forEach((i, value) {
  //     // print('index=$i, value=$value');
  //     Buildr(i,value);
  //   });
  // }

  @override
  Widget build(BuildContext context) {

    // return
    //   Column(
    //   children: [Buildr("Python",20),Buildr("JavaScript",100),Buildr("JavaScript",100),Buildr("JavaScript",100),Buildr("JavaScript",100)],
    // );
    //  var stackdata = OrgData.getTechStack("2021", 5);
    //  var stackData=stackdata.toString();
    //
    return FutureBuilder(
      future: OrgData.getTechStack("2021", 5),
      builder: (context, snap){
        if(snap.connectionState==ConnectionState.waiting){
          return Center(
            child: CircularProgressIndicator(),

          );
        }
        else{
          return Container(
            height: 200,
            child:
            ListView.builder(

              itemBuilder: (context, index) {
                List<List<dynamic>> k=OrgData.getMap();
                return Container(
                  // leading: Icon(Icons.check_box_outline_blank_outlined),
                  // title: Text("Tech Stack"),

                  child: Buildr(k[index][0],k[index][1]),
                );
              },
              itemCount: 5,
            ),
          );
        }
      });
    //   child: Container(
    //     height: 200,
    //     child: ListView.builder(
    //
    //       itemBuilder: (context, index) {
    //         return Container(
    //           // leading: Icon(Icons.check_box_outline_blank_outlined),
    //           // title: Text("Tech Stack"),
    //
    //           child: Buildr(stackData.),
    //         );
    //       },
    //       itemCount: 5,
    //     ),
    //   ),
    // );
  }
}

class Buildr extends StatelessWidget {
  static const shadow =
      BoxShadow(offset: Offset(0, 15), blurRadius: 27, color: Colors.black12);

  final String name;
  final int count;
  Buildr(this.name,this.count);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(22)),
          // color: Colors.purpleAccent,
        ),
        // color: Colors.purpleAccent,
        height: 80,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Colors.orange,
                boxShadow: const [shadow],
              ),
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
            ),
            // Positioned(
            //   top: 0,
            //   left: 0,
            //   child: Container(
            //     padding: const EdgeInsets.symmetric(horizontal: 0),
            //     height: 160,
            //     width: 200,
            //     // child: ClipRRect(
            //     //   borderRadius: const BorderRadius.only(
            //     //       bottomLeft: Radius.circular(22),
            //     //       topLeft: Radius.circular(22)),
            //     //   child: Image(
            //     //     // image: NetworkImage(playlist_images_url[index]),
            //     //     fit: BoxFit.fitHeight,
            //     //     alignment: Alignment.bottomLeft,
            //     //   ),
            //     // ),
            //   ),
            // ),
            Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        name,
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                    // Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      child: Text('Number of Projects: $count'),
                    ),


                  ],
                ),


          ],
        ),
      ),
    onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => Charts(),
        ));
    },
    );
  }
}

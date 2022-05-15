import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gsoc_helper/screens/organisations.dart';
import 'package:gsoc_helper/screens/tech-stack.dart';
import 'package:flutter/services.dart';
import 'package:gsoc_helper/screens/charts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const HomeScreen(),
      routes: {
        TechStack.routeName: (context) => TechStack(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // MaterialApp(
        //     theme: ThemeData(
        //       primarySwatch: Colors.orange,
        //     ),
        //     debugShowCheckedModeBanner: false,
        //     home:
        DefaultTabController(
            length: 2,
            child: Scaffold(
                appBar: AppBar(
                  toolbarHeight: 50,
                  bottom: const TabBar(
                    tabs: [
                      Tab(
                          icon: Icon(
                        Icons.format_list_bulleted_rounded,
                        color: Colors.white,
                      )),
                      Tab(
                          icon:
                              Icon(Icons.groups_rounded, color: Colors.white)),
                    ],
                  ),
                  backgroundColor: Color.fromARGB(255, 249, 171, 0),
                  title: Text(
                    'GSoC Helper',
                    style: TextStyle(color: Colors.white),
                  ),
                  elevation: 0,
                  leading: IconButton(
                    icon: Icon(Icons.search_outlined),
                    onPressed: () {},
                  ),
                  // leading: IconButton(
                  //   padding: EdgeInsets.symmetric(horizontal: 20),
                  //   onPressed: () {
                  //     Navigator.of(context).pop();
                  //   },
                  //   icon: Icon(
                  //     Icons.arrow_back,
                  //     size: 25,
                  //     color: Colors.white,
                  //   ),
                  // ),
                ),
                body: TabBarView(children: [TechStack(), Organisations()])));
  }
}

// Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton.icon(
//                 onPressed: () {},
//                 icon: Icon(Icons.account_balance_rounded),
//                 label: Text("Organisations")),
//             SizedBox(
//               height: 23,
//             ),
//             ElevatedButton.icon(
//                 onPressed: () {
//                   Navigator.of(context).pushNamed(TechStack.routeName);
//                 },
//                 icon: Icon(Icons.checklist_sharp),
//                 label: Text("Your Options")),
//             SizedBox(
//               height: 23,
//             ),
//             ElevatedButton.icon(
//                 onPressed: () {},
//                 icon: Icon(Icons.tour_rounded),
//                 label: Text("Probability of Success")),
//             SizedBox(
//               height: 23,
//             ),
//           ],
//         ),
//       ),

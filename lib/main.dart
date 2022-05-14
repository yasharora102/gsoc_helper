import 'package:flutter/material.dart';
import 'package:gsoc_helper/screens/organisations.dart';
import 'package:gsoc_helper/screens/tech-stack.dart';

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
        primarySwatch: Colors.blue,
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
    return Scaffold(
        appBar: AppBar(
          title: const Text("GSoC HELPER"),
        ),
        body: PageView(
          scrollDirection: Axis.horizontal,
          children: [TechStack(), Organisations(), TechStack()],
        ));
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
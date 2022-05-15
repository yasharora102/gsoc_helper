import 'package:flutter/material.dart';

class Charts extends StatefulWidget{
  @override
  _ChartsState createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 203, 13, 236),
          elevation: 0,
          leading: IconButton(
            padding: EdgeInsets.symmetric(horizontal: 20),
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              size: 25,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          title: Text('HI',
              style: TextStyle(
                color: Colors.white,
              ))),

    );
  }
}

import 'dart:collection';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart';

class Org {
  String name;
  String image;
  List<dynamic> techStack;
  String openings;

  Org(this.name, this.image, this.techStack, this.openings);
}

class OrgData {
  static List<Org> list = [];
  static Map<String, int> techStack5 = {};

  static List<List<dynamic>> getMap() {
    List<List<dynamic>> asd = [];
    techStack5.forEach((key, value) {
      List<dynamic> li = [key, value];
      asd.add(li);
    });
    return asd;
  }

  static Future<void> getData() async {
    final response = await rootBundle.loadString('assets/2021.json');
    var data = json.decode(response) as Map<String, dynamic>;
    int len = data["organizations"].length;
    // print(len);
    for (int i = 0; i < len; i++) {
      String title = data["organizations"][i]["name"];
      String image = data["organizations"][i]["image_url"];
      List<dynamic> techStack = data["organizations"][i]["topics"];
      int projectNo = data["organizations"][i]["num_projects"];
      list.add(Org(title, image, techStack, projectNo.toString()));
      // print("$title, $image, $techStack, $projectNo");
    }

    // print(response);
  }

  static Future<void> getTechStack(String year, int n) async {
    Map<String, int> techCount = {};
    final response = await rootBundle.loadString('assets/$year.json');
    var data = json.decode(response) as Map<String, dynamic>;
    int len = data["organizations"].length;
    for (int i = 0; i < len; i++) {
      List<dynamic> techStack = data["organizations"][i]["technologies"];
      for (String d in techStack) {
        // print(d);
        if (techCount.containsKey(d.trim())) {
          techCount.update(d, (value) => (value + 1));
        } else {
          techCount[d.trim()] = 1;
        }
      }
    }
    var sortedEntries = techCount.entries.toList()
      ..sort((e1, e2) {
        var diff = e2.value.compareTo(e1.value);
        if (diff == 0) diff = e2.key.compareTo(e1.key);
        return diff;
      });
    techCount = {};
    // List<List<dynamic>> asd=[];
    for (int i = 0; i < n; i++) {
      techStack5[sortedEntries.elementAt(i).key] =
          sortedEntries.elementAt(i).value;
    }
    // return techCount;
  }
}

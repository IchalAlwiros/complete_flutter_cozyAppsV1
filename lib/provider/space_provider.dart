import 'dart:convert';

import 'package:bwa_cozy/models/space.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SpaceProvider extends ChangeNotifier {
  static final String _baseUrl =
      'https://bwa-cozy.herokuapp.com/recommended-spaces';

  Future<List<Space>> getRecomendedSpace() async {
    try {
      var response = await http.get(
        Uri.parse(_baseUrl),
      );
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        List<Space> jobs = [];
        List parsedJson = jsonDecode(response.body);

        parsedJson.forEach((job) {
          jobs.add(Space.fromJson(job));
        });
        return jobs;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
  // Future<Space> getRecomendedSpaces() async {
  //   // List<Space> spaces = [];
  //   final result = await http.get(Uri.parse(_baseUrl));
  //   // print(result.statusCode);
  //   print(result.body);

  //   if (result.statusCode == 200) {
  //     return Space.fromJson(jsonDecode(result.body));
  //   } else {
  //     throw Exception('Failed to load top headlines');
  //   }
  // }
  // if (result.statusCode == 200) {
  //     List data = jsonDecode(result.body);
  //   //  spaces = data.map((item) => Space.fromJson(item)).toList()
  //   spaces = data.map((item) => Space.fromJson(item)).toList()
  //     return spaces;
  //   } else {
  //     return <Space>[];
  //   }
}
  // getRecommendedSpaces() async {
  //   var result = await http.get();

  //   print(result.statusCode);
  //   print(result.body);

  //   if (result.statusCode == 200) {
  //     List data = jsonDecode(result.body);
  //     List<Space> spaces = data.map((item) => Space.fromJson(item)).toList();
  //     return spaces;
  //   } else {
  //     return <Space>[];
  //   }
  // }


import 'package:flutter/material.dart';

class CoronaData {
  final int active;
  final String dist;

  CoronaData({this.active , this.dist});

  // ignore: missing_return
  factory CoronaData.fromJson(final json){
    return CoronaData(
      active: json["active"],
      dist: json["districtData"],
    );
  }
}
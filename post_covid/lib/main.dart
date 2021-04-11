import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:post_covid/search.dart';
import 'package:restcountries/restcountries.dart';
import 'package:http/http.dart' as http;

import 'CoronaUpdate.dart';

void main() async{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Post-Covid'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){
            showSearch(context: context, delegate: DataSearch());
          })
        ],
      ),
      body:
      Center(
        child: Image.network(
          'https://cdn.discordapp.com/attachments/830484732792799239/830816800664059924/Group_84x-8.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}


//JSON Data
Future<CoronaData> getCoronaData() async {
  final url = "https://api.covid19india.org/state_district_wise.json";
  final response = await http.get(url);

  if(response.statusCode == 200){
    final jsonUpdate = jsonDecode(response.body);
    return CoronaData.fromJson(jsonUpdate);
  }else{
    throw Exception();
  }
}

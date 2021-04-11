import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:post_covid/search.dart';

import 'CoronaUpdate.dart';
import 'main.dart';

class SecondScreen extends StatelessWidget {

  final CountryData country;

  SecondScreen({Key key, @required this.country}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome To India"),
      ),
      body:Center(
        // child: FutureBuilder<CoronaData>(
        //   future: getCoronaData(),
        //   builder: (context , snapshot){
        //     if(snapshot.hasData){
        //       final finalData = snapshot.data;
        //       return Text("Current Active Case : ${finalData.active}");
        //     }else if(snapshot.hasError){
        //       return Text(snapshot.error.toString());
        //     }
        //     return CircularProgressIndicator();
        //   },
        // ),
        child: Center(child: _getCard())
      )
    );
  }

  Widget _getCard(){
    if(country.activeCases >= 100000){
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Column(
            children: <Widget>[
              Image.asset("assets/India.jpg",
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(26.0),
                child: Text("Active Cases: ${country.activeCases}"
                    ".(Too Risky!!) " ,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        backgroundColor: Colors.red,
                    fontSize: 32),
                ),
              ),
            ],
          ),
        ),
      );
    }else if(country.activeCases < 100000 && country.activeCases >= 10000){
      return Card(
        child: Text("Active Cases: ${country.activeCases}",
            style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold)
        ),
        color: Colors.yellow,
      );
    }else{
      return Card(
        child: Text("Active Cases: ${country.activeCases}",
            style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold)
        ),
        color: Colors.green,
      );
    }
  }



}

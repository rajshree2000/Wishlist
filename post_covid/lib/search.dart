import 'package:flutter/material.dart';
import 'package:post_covid/CoronaUpdate.dart';
import 'package:post_covid/SecondScreen.dart';
import 'package:post_covid/main.dart';
import 'package:restcountries/restcountries.dart';

class DataSearch extends SearchDelegate<String> {

  final countries = [
    "Japan",
    "New Zealand",
    "Australia",
    "Sweden",
    "South Africa",
    "Brazil",
    "China",
    "Pakistan",
    "India",
    "Iraq",
  ];

  final recent = [
    "U.S.A.",
    "U.K.",
    "Iran"
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    //actions for app bar
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: (){
        query = "";
      })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //leading icon on the left of app bar
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: (){
          close(context, null);
        }
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //show result based on selection
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //show when somebody searches for something

    final suggest =  query.isEmpty
        ?recent
        :countries.where((e) => e.startsWith(query)).toList();
    return ListView.builder(itemBuilder: (context,index) => ListTile(

      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  SecondScreen(country : new CountryData("$index", 1101525)))
        );
        //showResults(context);
      },

      leading: Icon(Icons.location_city),
      title: Text(suggest[index]),
      ),
        itemCount: suggest.length,
    );



  }

}

class CountryData{
  final String name;
  final int activeCases;

  CountryData(this.name , this.activeCases);
}



import 'package:flutter/material.dart';

import 'list_operation.dart';

class Whale extends StatefulWidget {
  const Whale({Key? key}) : super(key: key);

  @override
  State<Whale> createState() => _WhaleState();
}

class _WhaleState extends State<Whale> {
  List<String> numberT = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
  String whaleStr =
      "He's name is jack. jack is a captain of black pearl. Black Pearl is ship owned by Caribbean sea ";
  List<String> planet = [
    'Mercury',
    'Earth',
    'Venus',
    'Jupiter',
    'pluto',
    'Neptune',
    'Uranus',
    'Saturn',
    'Sun'
  ];
  String allRep ="";
  String  replacerangedis ="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      appBar: AppBar(
        title: Text("Whale"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListOperation()),
                );
              },
              icon: Icon(Icons.ac_unit_outlined, size: 30),
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey.shade800,
            padding: EdgeInsets.all(15),
            child: Text(
              whaleStr,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          Container(
            color: Colors.blue,
            padding: EdgeInsets.all(10),
            child: Text(
              whaleStr.replaceAll("jack", "Aryan"),
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          Container(
            width: double.maxFinite,
            color: Colors.grey.shade800,
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                numberT.toString(),
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          Container(
            width: double.maxFinite,
            color: Colors.grey.shade900,
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
             "Reversed value - " +  numberT.reversed.toString(),
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          Container(
            width: double.maxFinite,
            color: Colors.grey.shade900,
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                allRep,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          Spacer(),

           ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:  Colors.blueGrey.shade700,
              ),
              onPressed: () {
               numberT.replaceRange(0, 3, ['10', '20', '40']);
               // print(numberT);
               // numberT.w
                
              allRep =  whaleStr.replaceAll("black",   "white");
                  print(allRep);

               /* for (var p in planet) {
                  print(p);
                }*/
                /* planet.forEach((String planet) {
                    print(planet);*/

     },

              child: Text("Click to see Result"),
            ),

        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Home extends  StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    List<String> countries = [];

    var seen = Set<String>();
    List<String> uniquelist = countries.where((country) => seen.add(country)).toList();
    print(uniquelist);
    //output:  [Nepal, USA, Canada, China, Russia]

    return Scaffold(
        appBar: AppBar(
          title: Text("Remove Duplicates from List"),
          backgroundColor: Colors.redAccent,
        ),
        body: Container(
          // alignment: Alignment.center,
          // padding: EdgeInsets.all(20),
          // child: Column(
          //   children:uniquelist.map((cone){
          //     return Container(
          //       child: Card(
          //         child:Container(
          //             width: double.infinity,
          //             padding: EdgeInsets.all(15),
          //             child: Text(cone, style: TextStyle(fontSize: 18))),
          //       ),
          //     );
          //   }).toList(),
          // ),
        )
    );
  }
}
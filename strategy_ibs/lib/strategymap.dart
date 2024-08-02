import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home.dart';
class map extends StatefulWidget {
  const map({super.key});

  @override
  State<map> createState() => _mapState();
}

class _mapState extends State<map> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:  SystemUiOverlayStyle(
          statusBarColor: Colors.black45,
        ),
        title: Text('Strategy',
          style: TextStyle(
              color: Colors.white
          ),
        ),
        backgroundColor: Colors.deepPurple,
        elevation: 0,

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
    Padding(
    padding: const EdgeInsets.only(top: 16,right: 16,left: 16 ,bottom: 0),
    child: Row(
      children: [
    Text(
    'Strategy Map',
    style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    ),
    ),
      ],
    ),
    ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>MyHomePage(title: '',)),
              );
            },
            child: Text(
              '<back',
              style: TextStyle(color: Colors.black,
            ),
          ),
          ),
    Padding(
    padding: const EdgeInsets.all(10),
      child: Container(
        width: 300,
        height: MediaQuery.of(context).size.height * 0.4,

        decoration: BoxDecoration(
          color: Colors.white70,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes the direction of the shadow
            ),
          ],
        ),
        padding: EdgeInsets.only(left: 10,right: 10,top:10,bottom: 5 ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft, // sets alignment to center
              child: Text('Current position',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

          Container(
              width: 300,
              height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white70,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes the direction of the shadow
                ),
              ],
            ),
              child: Text('Strategic Isusse',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold
              ),

              ),
            ),
            SizedBox(height: 15,),
            Container(
              width: 300,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white70,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes the direction of the shadow
                  ),
                ],
              ),
              child: Text(
                'SWOT',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                ),
            ),
            )
          ],
        ),
      ),
        ),
    ],
    ),
    );
  }
}

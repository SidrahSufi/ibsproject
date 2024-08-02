import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:strategy_ibs/strategymap.dart';
// import 'package:strategy/color.dart';

import 'home.dart';





class StrategyPlanner extends StatefulWidget {
  @override
  _StrategyPlannerState createState() => _StrategyPlannerState();
}

class _StrategyPlannerState extends State<StrategyPlanner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:  SystemUiOverlayStyle(
          statusBarColor: Colors.black45,
        ),
        title: Text('Strategy Planner',
          style: TextStyle(
              color: Colors.white
          ),
        ),
        backgroundColor: Colors.deepPurple,
        elevation: 0,

      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              flex: 0,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Text(
                          'xyz',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          'strategic plan',

                          style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),


                        SizedBox(height: 8.0),
                        Text(
                          'Strategic Principles',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // SizedBox(height: 16.0),
                        // Text(
                        //   'one month',
                        //   style: TextStyle(
                        //     fontSize: 16.0,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),

                        SizedBox(height: 8.0),

                        _buildStrategyPrincipleItem('Current Position'),
                        _buildStrategyPrincipleItem('Strategic Foundation'),
                        _buildStrategyPrincipleItem('Organizational Strategy'),
                        _buildStrategyPrincipleItem('Strategic Direction'),



                      ],
                    ),


                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'one month',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 8.0),
                        Text(
                          'Strategic Elements',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // SizedBox(height: 16.0),
                        // Text(
                        //   'one month',
                        //   style: TextStyle(
                        //     fontSize: 16.0,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),

                        SizedBox(height: 8.0),

                        _buildStrategyPrincipleItem('Strategic issue'),
                        _buildStrategyPrincipleItem('External Analysis'),
                        _buildStrategyPrincipleItem('SWOT'),
                       _buildStrategyPrincipleItem('Core purpose'),




                      ],
                    ),
                  ]

              ),
            ),

            // Expanded(
            //   flex: 1,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         'Strategic Elements',
            //         style: TextStyle(
            //           fontSize: 16.0,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //       SizedBox(height: 8.0),
            //       Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: <Widget>[
            //             _buildStrategicElementItem('Strategic issues'),
            //             _buildStrategicElementItem('External Analysis'),
            //             _buildStrategicElementItem('SWOT'),
            //   ]
            //       ),
            //
            //       Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: <Widget>[
            //             _buildStrategicElementItem('Core Purpose'),
            //             _buildStrategicElementItem('Core Values'),
            //             _buildStrategicElementItem('BHAG'),
            //           ]
            //       ),
            //
            //       // _buildStrategicElementItem('One Phase Strategy'),
            //       // _buildStrategicElementItem('Sandbox'),
            //       // _buildStrategicElementItem('Key Differentiators'),
            //       // _buildStrategicElementItem('Competitive advantage'),
            //       // _buildStrategicElementItem('Profit/X'),
            //     ],
            //
            //   ),
            // ),

            SizedBox(height: 10),
            Expanded(
              flex: 1,
              child: Container(
                width:MediaQuery.of(context).size.width * 0.9,
                height:
                MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: GridView.count(
                  crossAxisCount: 1,
                  children: List.generate(
                    20,
                        (index) => Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Center(
                        child: Text(''),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child:  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)
                        )
                    ),
                    onPressed: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>map()),
                      );
                    },
                    child: Text('Save',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }

  Widget _buildStrategyPrincipleItem(String text) {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.only(bottom: 4.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 14.0),
      ),
    );
  }

  Widget _buildStrategicElementItem(String text) {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.only(bottom: 4.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 14.0),
      ),
    );
  }
}
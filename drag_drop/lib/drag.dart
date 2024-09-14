import 'package:flutter/material.dart';

class StrategyPlanner extends StatefulWidget {
  @override
  _StrategyPlannerState createState() => _StrategyPlannerState();
}

class _StrategyPlannerState extends State<StrategyPlanner> {
  List<String> _strategyPrinciples = [
    'Current Position',
    'Strategic Foundation',
    'Organizational Strategy',
    'Strategic Direction',
  ];

  List<String> _strategicElements = [
    'Strategic issue',
    'External Analysis',
    'SWOT',
    'Core purpose',
  ];

  List<String> _droppedItems = [];
  List<String> _droppedChildItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Strategy Planner'),
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
                          fontWeight: FontWeight.bold,
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
                      ..._strategyPrinciples.map((principle) {
                        return Draggable<String>(
                          data: principle,
                          child: _buildStrategyPrincipleItem(principle),
                          feedback: _buildStrategyPrincipleItem(principle),
                          childWhenDragging: Container(),
                        );
                      }),
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
                      ..._strategicElements.map((element) {
                        return Draggable<String>(
                          data: element,
                          child: _buildStrategicElementItem(element),
                          feedback: _buildStrategicElementItem(element),
                          childWhenDragging: Container(),
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            DragTarget<String>(
              onWillAccept: (data) => true,
              onAccept: (data) {
                setState(() {
                  _droppedItems.add(data);
                });
              },
              builder: (context, candidateData, rejectedData) {
                return Container(
                  height: 500,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    children: [
                      (_droppedItems.length>0 ?
                      Text('(${_droppedItems.length}) Drop items here') :
                      Text('Drop items here')),

                      ..._droppedItems.map((item) {

                        return _buildDroppedItem(item);
                      }),

                    ],
                  ),
                );
              },
            ),
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

  Widget _buildDroppedItem(String text) {

    return ExpansionTile(title: Text(text),
    children: [
      Padding(padding: EdgeInsets.all(10)
      ,child:
        // Text("child 1 here")

        DragTarget<String>(
          onWillAccept: (data) => true,
          onAccept: (data) {
            setState(() {
              _droppedChildItems.add(data);
            });
          },
          builder: (context, candidateData, rejectedData) {
            return Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                children: [
                  Text('Drop items here'),
                  ..._droppedChildItems.map((item) {
                    return _buildDroppedChildItem(item);
                  }),
                ],
              ),
            );
          },
        ),



        )
      // Text("child 1 here")
    ],);


    // return Container(
    //   padding: EdgeInsets.all(8.0),
    //   margin: EdgeInsets.only(bottom: 4.0),
    //   decoration: BoxDecoration(
    //     border: Border.all(color: Colors.grey),
    //   ),
    //   child: Text(
    //     text,
    //     style: TextStyle(fontSize: 14.0),
    //   ),
    // );
  }

  Widget _buildDroppedChildItem(String text) {

    return ExpansionTile(title: Text(text),
    children: [
      Padding(padding: EdgeInsets.all(10)
      ,child:
        Text("child 1 here")





        )
      // Text("child 1 here")
    ],);


    // return Container(
    //   padding: EdgeInsets.all(8.0),
    //   margin: EdgeInsets.only(bottom: 4.0),
    //   decoration: BoxDecoration(
    //     border: Border.all(color: Colors.grey),
    //   ),
    //   child: Text(
    //     text,
    //     style: TextStyle(fontSize: 14.0),
    //   ),
    // );
  }
}
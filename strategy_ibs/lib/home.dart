import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:strategy_ibs/utils.dart';

import 'login.dart';

// import 'form.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  final List<StrategyItem> _strategies = [
    StrategyItem(
        name: 'My Strategy',
        parentStrategy: 'New strategy',
        team: 'My team',
        plans: 0,
        status: 'Active'),
    StrategyItem(
        name: 'New strategy',
        parentStrategy: '--',
        team: 'Project Team',
        plans: 0,
        status: 'Inactive'),
    // StrategyItem(
    //     name: 'Marketing',
    //     parentStrategy: '--',
    //     team: '--',
    //     plans: 0,
    //     status: 'Inactive'),
    // StrategyItem(
    //     name: 'ONE YEAR STRATEGY',
    //     parentStrategy: '--',
    //     team: 'Project Team',
    //     plans: 0,
    //     status: 'Inactive'),
    // StrategyItem(
    //     name: 'qwqw',
    //     parentStrategy: 'THREE YEAR STRATEGY',
    //     team: '--',
    //     plans: 0,
    //     status: 'Inactive'),
    // StrategyItem(
    //     name: 'THREE YEAR STRATEGY',
    //     parentStrategy: '--',
    //     team: 'Pakistan',
    //     plans: 0,
    //     status: 'Inactive'),
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:  SystemUiOverlayStyle(
          statusBarColor: Colors.black45,
        ),
        backgroundColor:
        Colors.deepPurple,


        title: Text('Strategy',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [

          IconButton(
            icon: Icon(Icons.message, color: Colors.white,),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.grid_view, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.exit_to_app, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>LoginScreen ()),
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'All Strategies',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await showInformationDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0)
                      )
                  ),
                  child: Text(
                    'New Strategy',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              // Add this to make the ListView scrollable
              child: ListView.builder(
                shrinkWrap: true, // Add this to avoid the ListView overflow error
                itemCount: _strategies.length,
                itemBuilder: (context, index) {
                  return StrategyListTile(
                    strategy: _strategies[index],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StrategyItem {
  final String name;
  final String parentStrategy;
  final String team;
  final int plans;
  final String status;

  StrategyItem({
    required this.name,
    required this.parentStrategy,
    required this.team,
    required this.plans,
    required this.status,
  });
}

class StrategyListTile extends StatelessWidget {
  final StrategyItem strategy;

  const StrategyListTile({Key? key, required this.strategy}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.yellow[200],
        ),
        child: Icon(
          Icons.settings,
          color: Colors.yellow[600],
        ),
      ),
      title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(strategy.name),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0.0),
                color: strategy.status == 'Active'
                    ? Colors.green[200]
                    : Colors.red[200],
              ),
              child: Text(
                strategy.status,
                style: TextStyle(
                  color: strategy.status == 'Active'
                      ? Colors.green[900]
                      : Colors.red[900],
                ),
              ),
            )
          ]
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Parent Strategy: ${strategy.parentStrategy}'),
          Text('Team: ${strategy.team}'),
          Text('${strategy.plans}'),

        ],
      ),
      trailing:
      Icon(Icons.more_vert),


    );
  }
}
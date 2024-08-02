import 'package:flutter/material.dart';


import 'canvas.dart';
import 'color.dart';
import 'home.dart';
Future<void>  showInformationDialog(BuildContext context)async {
  return await showDialog(context: context,
      builder: (context){
        final _formKey = GlobalKey<FormState>();
        final _strategyNameController = TextEditingController();
        String? _parentStrategy;
        String? _team;
        String? _timeframe;
        String? _strategyType;
        String? _status;

        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero
            ),

            content:  Container(

              width: MediaQuery.of(context).size.width * 0.8,
              height:
              MediaQuery.of(context).size.height * 0.7,
              child:
              SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Create new strategy',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      TextFormField(
                        controller: _strategyNameController,
                        decoration: const InputDecoration(
                          labelText: 'Strategy Name',
                          hintText: 'Enter strategy name',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a strategy name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                            labelText: 'Parent Strategy',
                            suffixStyle: TextStyle(
                                fontSize: 10
                            )

                        ),
                        value: _parentStrategy,
                        // hint: const Text('Parent Strategy'),
                        items: const [
                          DropdownMenuItem(
                            value: 'select',
                            child: Text('Select'),
                          ),
                          DropdownMenuItem(
                            value: 'option1',
                            child: Text('marketing'),
                          ),
                          DropdownMenuItem(
                            value: 'option2',
                            child: Text('finance'),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _parentStrategy = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value == 'select') {
                            return 'Please select a parent strategy';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                            labelText: 'Team',
                            suffixStyle: TextStyle(
                                fontSize: 10
                            )
                        ),

                        value: _team,
                        // hint: const Text('Team'),
                        items: const [
                          DropdownMenuItem(
                            value: 'select',
                            child: Text('Select'),
                          ),
                          DropdownMenuItem(
                            value: 'team1',
                            child: Text('Team 1'),
                          ),
                          DropdownMenuItem(
                            value: 'team2',
                            child: Text('Team 2'),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _team = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value == 'select') {
                            return 'Please select a team';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                labelText: 'Timeframe',
                                suffixStyle: TextStyle(
                                    fontSize: 10
                                ),
                              ),
                              value: _timeframe,
                              hint: const Text('Timeframe'),
                              items: const [
                                DropdownMenuItem(
                                  value: 'select',
                                  child: Text('Select'),
                                ),
                                DropdownMenuItem(
                                  value: 'one month',
                                  child: Text('one month'),
                                ),
                                DropdownMenuItem(
                                  value: 'two months',
                                  child: Text('two months'),
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  _timeframe = value;
                                });
                              },
                              validator: (value) {
                                if (value == null || value == 'select') {
                                  return 'Please select a timeframe';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                  labelText: 'Status',
                                  suffixStyle: TextStyle(
                                      fontSize: 10
                                  )),
                              value: _status,
                              // hint: const Text('Status'),
                              items: const [
                                DropdownMenuItem(
                                  value: 'active',
                                  child: Text('Active'),
                                ),
                                DropdownMenuItem(
                                  value: 'inactive',
                                  child: Text('Inactive'),
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  _status = value;
                                });
                              },
                              validator: (value) {
                                if (value == null) {
                                  return 'Please select a status';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                            labelText: 'Strategy Type',
                            suffixStyle: TextStyle(
                                fontSize: 10
                            )),
                        value: _strategyType,
                        // hint: const Text('Strategy Type'),
                        items: const [
                          DropdownMenuItem(
                            value: 'select',
                            child: Text('Select'),
                          ),
                          DropdownMenuItem(
                            value: 'type1',
                            child: Text('Marketing'),
                          ),
                          DropdownMenuItem(
                            value: 'type2',
                            child: Text('finance'),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _strategyType = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value == 'select') {
                            return 'Please select a strategy type';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 32.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(

                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>MyHomePage(title: '',)),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0x5A6268),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0)
                                )
                            ),
                            child: Text('Cancel',
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // Process data here
                                print('Strategy Name: ${_strategyNameController.text}');
                                print('Parent Strategy: $_parentStrategy');
                                print('Team: $_team');
                                print('Timeframe: $_timeframe');
                                print('Strategy Type: $_strategyType');
                                print('Status: $_status');
                              }
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>StrategyPlanner()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.pink,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0)
                                )
                            ),
                            child: const Text('Save',
                              style: TextStyle(
                                color: Colors.white,


                              ),),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );


        });
      });
}
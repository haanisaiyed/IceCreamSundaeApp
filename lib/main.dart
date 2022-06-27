import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _currentSize = 'Small';
  var _currentFlavor = 'Vanilla';

  var _peanuts = false;
  var _almonds = false;
  var _strawberries = false;
  var _gummybears = false;
  var _mms = false;
  var _brownies = false;
  var _oreos = false;
  var _marshmallows = false;

  var _price = '\$0.00';

  var _sliderValue= 0;

  void handleCheckBox(String name, bool value){
    setState(() {
      switch(name){
        case ' Peanuts':
          _peanuts = value;
          break;
        case 'Almonds':
          _almonds = value;
          break;
        case 'Strawberries':
          _strawberries = value;
          break;
        case 'Gummy Bears':
          _gummybears = value;
          break;
        case 'M&Ms':
          _mms = value;
          break;
        case 'Brownies':
          _brownies = value;
          break;
        case 'Oreos':
          _oreos = value;
          break;
        case 'Marshmallows':
          _marshmallows = value;
          break;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ice Cream Sundae'),
          actions: [
            PopupMenuButton<String>(
                itemBuilder: (BuildContext context){
                  return [
                    PopupMenuItem(
                        child: Text('Order History'),
                    value: 'Order History',
                    ),
                    PopupMenuItem(
                        child: Text('About'),
                    value: 'About',
                    ),
                  ];
                }
            )
          ],
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:13.0),
                  child: Text('Sundae Maker',
                  style: TextStyle(
                    fontSize: 38.0,
                    ),
                  ),
                ),
                SizedBox(height: 15.0,),
                Container(
                  child: Column(
                    children: [
                      Text('$_price',
                        style: TextStyle(
                          fontSize: 26.0,
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Size: ',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          DropdownButton(
                              items: [
                                DropdownMenuItem(
                                  child: Text('Small'),
                                  value: 'Small',
                                ),
                                DropdownMenuItem(
                                  child: Text('Medium'),
                                  value: 'Medium',
                                ),
                                DropdownMenuItem(
                                  child: Text('Large'),
                                  value: 'Large',
                                ),
                              ] ,
                              value: _currentSize,
                              onChanged: (String? str){
                                setState(() {
                                  _currentSize = str!;
                                });
                              }),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Flavor: ',
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          DropdownButton(
                              items: [
                                DropdownMenuItem(
                                  child: Text('Vanilla'),
                                  value: 'Vanilla',
                                ),
                                DropdownMenuItem(
                                  child: Text('Chocolate'),
                                  value: 'Chocolate',
                                ),
                                DropdownMenuItem(
                                  child: Text('Strawberry'),
                                  value: 'Strawberry',
                                ),
                              ] ,
                              value: _currentFlavor,
                              onChanged: (String? str){
                                setState(() {
                                  _currentFlavor = str!;
                                });
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.0,),
                Container(
                  child:
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                CheckboxListTile(
                                  controlAffinity: ListTileControlAffinity.platform,
                                  value: _peanuts,
                                  onChanged: (bool? val){
                                    handleCheckBox('Peanuts',val!);
                                    },
                                  title: Text("Peanuts",
                                    style: TextStyle(
                                      fontSize: 17.0,
                                    ),),
                                ),
                                CheckboxListTile(
                                  controlAffinity: ListTileControlAffinity.platform,
                                  value: _almonds,
                                  onChanged: (bool? val){
                                    handleCheckBox('Almonds',val!);
                                  },
                                  title: Text("Almonds",
                                    style: TextStyle(
                                      fontSize: 17.0,
                                    ),),
                                ),
                                CheckboxListTile(
                                  controlAffinity: ListTileControlAffinity.platform,
                                  value: _strawberries,
                                  onChanged: (bool? val){
                                    handleCheckBox('Strawberries',val!);
                                  },
                                  title: Text("Strawberries",
                                    style: TextStyle(
                                      fontSize: 17.0,
                                    ),),
                                ),
                                CheckboxListTile(
                                  controlAffinity: ListTileControlAffinity.platform,
                                  value: _gummybears,
                                  onChanged: (bool? val){
                                    handleCheckBox('Gummy Bears',val!);
                                  },
                                  title: Text("Gummy Bears",
                                    style: TextStyle(
                                      fontSize: 17.0,
                                    ),),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                CheckboxListTile(
                                  controlAffinity: ListTileControlAffinity.platform,
                                  value: _mms,
                                  onChanged: (bool? val){
                                    handleCheckBox('M&Ms',val!);
                                  },
                                  title: Text("M&Ms",
                                    style: TextStyle(
                                      fontSize: 17.0,
                                    ),),
                                ),
                                CheckboxListTile(
                                  controlAffinity: ListTileControlAffinity.platform,
                                  value: _brownies,
                                  onChanged: (bool? val){
                                    handleCheckBox('Brownies',val!);
                                  },
                                  title: Text("Brownies",
                                    style: TextStyle(
                                      fontSize: 17.0,
                                    ),),
                                ),
                                CheckboxListTile(
                                  controlAffinity: ListTileControlAffinity.platform,
                                  value: _oreos,
                                  onChanged: (bool? val){
                                    handleCheckBox('Oreos',val!);
                                  },
                                  title: Text("Oreos",
                                    style: TextStyle(
                                      fontSize: 17.0,
                                    ),),
                                ),
                                CheckboxListTile(
                                  controlAffinity: ListTileControlAffinity.platform,
                                  value: _marshmallows,
                                  onChanged: (bool? val){
                                    handleCheckBox('Marshmallows',val!);
                                  },
                                  title: Text("Marshmallows",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                    ),),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                ),
                SizedBox(height: 12.0,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('Fudge: ',
                            style: TextStyle(
                              fontSize: 17.0,
                            ),),
                          Expanded(
                            child: Slider(
                              value: _sliderValue.toDouble(),
                              min: 0.0,
                              max: 3.0,
                              label: _sliderValue.toString(),
                              divisions: 3,
                              onChanged: (double val){
                                setState(() {
                                  _sliderValue=val.toInt();
                                });
                              },
                            ),
                          ),
                          Text('$_sliderValue oz',
                            style: TextStyle(
                              fontSize: 17.0,
                            ),),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.0,),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButton(onPressed: () {},
                            child: Text('The Works',
                              style: TextStyle(
                                fontSize: 18.0,
                              ),)
                        ),
                      ),
                      Expanded(
                        child: TextButton(onPressed: () {},
                            child: Text('Reset',
                              style: TextStyle(
                                fontSize: 18.0,
                              ),)
                        ),
                      ),
                      Expanded(
                        child: TextButton(onPressed: () {},
                            child: Text('Order',
                              style: TextStyle(
                                fontSize: 18.0,
                              ),)
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

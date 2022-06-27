import 'package:flutter/material.dart';
import 'package:assignment4_saiyed/about_screen.dart';
import 'package:assignment4_saiyed/order.dart';
import 'package:assignment4_saiyed/order_screen.dart';


void main() {
  runApp(const MainScreen());
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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

  var _peanutscost = 0.00;
  var _almondscost = 0.00;
  var _strawberriescost = 0.00;
  var _gummybearscost = 0.00;
  var _mmscost = 0.00;
  var _browniescost = 0.00;
  var _oreoscost = 0.00;
  var _marshmallowscost = 0.00;
  var _fudgecost = 0.00;

  var _price = 2.99;

  final List<Order> _orders = [];
  var _sliderValue= 0;

  void handleCheckBox(String name, bool value){
    setState(() {
      switch(name){
        case 'Peanuts':
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
  void updateUI(){
    setState(() {
      if(_currentSize == 'Small'){
        _price = 2.99;
      } else if (_currentSize == 'Medium'){
        _price = 3.99;
      } else {
        _price = 4.99;
      }
      if (_sliderValue == 0){
        _fudgecost = 0.0;
      } else if (_sliderValue==1) {
        _fudgecost = 0.15;
      } else if (_sliderValue == 2){
        _fudgecost=0.25;
      } else {
        _fudgecost=0.30;
      }
      if (_peanuts){
        _peanutscost = 0.15;
      } else{
        _peanutscost = 0.0;
      }

      if (_almonds){
        _almondscost = 0.15;
      }else{
        _almondscost = 0.0;
      }

      if (_strawberries){
        _strawberriescost = 0.20;
      }else{
        _strawberriescost = 0.0;
      }

      if (_gummybears){
        _gummybearscost = 0.20;
      }else{
        _gummybearscost = 0.0;
      }

      if (_mms){
        _mmscost = 0.25;
      }else{
        _mmscost = 0.0;
      }

      if (_brownies){
        _browniescost = 0.2;
      }else{
        _browniescost = 0.0;
      }

      if (_oreos){
        _oreoscost = 0.20;
      }else{
        _oreoscost = 0.0;
      }

      if (_marshmallows){
        _marshmallowscost = 0.15;
      }else{
        _marshmallowscost = 0.0;
      }
      _price = _price+_fudgecost+_peanutscost+_almondscost+_strawberriescost+_gummybearscost+_mmscost+_browniescost+_oreoscost+_marshmallowscost;

    });
  }

  void handleWorks(){
    setState(() {
      _peanuts=true;
      _almonds =true;
      _strawberries =true;
      _gummybears =true;
      _mms =true;
      _brownies =true;
      _oreos =true;
      _marshmallows=true;

      _sliderValue = 3;
      _currentSize = 'Large';
      updateUI();
    });
  }

  void handleReset(){
    setState(() {
      _peanuts=false;
      _almonds =false;
      _strawberries =false;
      _gummybears =false;
      _mms =false;
      _brownies =false;
      _oreos =false;
      _marshmallows=false;

      _sliderValue = 0;
      _currentSize = 'Small';
      _currentFlavor="Vanilla";
      updateUI();
    });
  }
  void handleOrder(){
    var _dat = new DateTime.now();
    setState(() {
      _orders.add(Order(_dat.toString(), _currentFlavor, _price ,_currentSize));
    });

    handleReset();
  }


  void gotoAboutScreen(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AboutScreen()),
    );
  }
  void gotoOrderScreen(){
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => OrderScreen(
            orders: _orders,
          )
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ice Cream Sundae'),
          actions: [
            PopupMenuButton(
                onSelected: (choice){
                  if(choice == 'About') {
                    gotoAboutScreen();
                  } else if (choice == 'Order History'){
                    gotoOrderScreen();
                  }
                },
                itemBuilder: (context){
                  return [
                    const PopupMenuItem(
                      value: 'Order History',
                      child: Text('Order History'),

                    ),
                    const PopupMenuItem(
                      value: 'About',
                      child: Text('About'),

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
                      Text('\$${double.parse((_price).toStringAsFixed(2))}',
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
                                updateUI();
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
                                updateUI();
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
                                updateUI();
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
                                updateUI();
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
                                updateUI();
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
                                updateUI();
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
                                updateUI();
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
                                updateUI();
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
                                updateUI();
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
                                  updateUI();
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
                        child: TextButton(onPressed: handleWorks,
                            child: Text('The Works',
                              style: TextStyle(
                                fontSize: 18.0,
                              ),)
                        ),
                      ),
                      Expanded(
                        child: TextButton(onPressed: handleReset,
                            child: Text('Reset',
                              style: TextStyle(
                                fontSize: 18.0,
                              ),)
                        ),
                      ),
                      Expanded(
                        child: TextButton(onPressed: handleOrder,
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

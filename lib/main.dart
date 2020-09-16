import 'package:flutter/material.dart';
import 'actions.dart';

var input;

void main() => runApp(MaterialApp(
  title: "Random Recipe Madness!",
  home: Home(),
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<String> _preferences = getPrefs();
  int _value = getValue();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Random Recipe Madness!"),
        centerTitle: true,
        backgroundColor: Colors.red[900],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget> [
            Image(
              image: AssetImage(
                  'assets/RandomRamsay.png',
              ),
              height: 250,
              width: 250
            ),
            Text(
                "Please enter your preferences, then press 'GO' to start:",
                style: TextStyle(
                  fontSize: 25,
                ),
              textAlign: TextAlign.center,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  DropdownButton(
                      value:_value,
                      items: [
                        addItem(1, "Vegan"),
                        addItem(2, "Vegetarian"),
                        addItem(3, "Low-carb"),
                        addItem(4, "Keto"),
                        addItem(5, "Low-fat"),
                        addItem(6, "Sugar-free"),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                          doAction2();
                        });
                      }
                  ),
                  DropdownButton(
                      value: _value,
                      items: [
                        addItem(1, "Breakfast"),
                        addItem(2, "Lunch"),
                        addItem(3, "Dinner"),
                        addItem(4, "Snack"),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                          doAction1();
                        });
                      }),
                  DropdownButton(
                      value: _value,
                      items: [
                        addItem(1, "No allergies"),
                        addItem(2, "Peanut allergy"),
                        addItem(3, "Tree nut allergy"),
                        addItem(4, "Lactose intolerant"),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                          doAction3();
                        });
                      }
                  )
                ]
            ),
            ButtonTheme(
              minWidth: 200,
              height: 60,
              child: RaisedButton(
                onPressed: () => {
                  findRecipe(_preferences),
                  print(getPrefs())
                },
                child: Text(
                  "GO",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                color: Colors.red,
              ),
            ),
          ]
        ),
      ),
    );
  }

}
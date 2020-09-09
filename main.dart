import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  initialRoute: "/",
  routes: {
    "/": (context) => Menu(),
    "/Breakfast": (context) => Breakfast(),
  }
));


class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Random Recipe Madness!"),
        centerTitle: true,
        backgroundColor: Colors.red[900],
      ),
      body: Center(
        child: ButtonTheme(
          minWidth: 200.0,
          height: 100.0,
          child: RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/Breakfast");
            },
            child: Text(
                "Breakfast",
                style: new TextStyle(
                  fontSize: 70.0,
                  color: Colors.white,
                )
            ),
            color: Colors.redAccent,
          )
        ),
      ),
    );
  }
}

class Breakfast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Breakfast"),
        centerTitle: true,
      ),
    );
  }
}



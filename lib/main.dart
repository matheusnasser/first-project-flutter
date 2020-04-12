import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Contador de Pessoas", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _message = "Pode Entrar";
  void changePeople(int delta) {
    setState(() {
      _people += delta;
    });
    if (_people < 0) {
      _message = "Mundo invertido?";
    } else if (_people <= 10) {
      _message = "Pode Entrar";
    } else {
      _message = "Lotado";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/original.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas: $_people",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  child: FlatButton(
                    child: Text(
                      "+1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                    onPressed: () {
                      changePeople(1);
                    },
                  ),
                  padding: EdgeInsets.all(10.0),
                ),
                Padding(
                  child: FlatButton(
                    child: Text(
                      "-1",
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                    onPressed: () {
                      changePeople(-1);
                    },
                  ),
                  padding: EdgeInsets.all(10.0),
                )
              ],
            ),
            Text("$_message",
                style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0,
                ))
          ],
        )
      ],
    );
  }
}

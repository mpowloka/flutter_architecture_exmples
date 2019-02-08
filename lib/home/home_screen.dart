import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Row(
          children: <Widget>[
            RaisedButton(
                child: Text("MVP Example"),
                onPressed: () {
                  Navigator.pushNamed(context, '/mvpExample');
                })
          ],
        ),
      ),
    );
  }
}

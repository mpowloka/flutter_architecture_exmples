import 'package:flutter/material.dart';
import 'package:flutter_architecture_exmples/bloc/navigation/routes.dart';
import 'package:flutter_architecture_exmples/mvp/navigation/routes.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  child: Text("MVP Example"),
                  onPressed: () {
                    Navigator.push(context, MvpRoutes.getListOfItemsRoute());
                  }),
              RaisedButton(
                  child: Text("BLoC Example"),
                  onPressed: () {
                    Navigator.push(context, BlocRoutes.getListOfItemsRoute());
                  }),
            ],
          ),
        ));
  }
}

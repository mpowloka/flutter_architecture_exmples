import 'package:flutter/material.dart';
import 'package:flutter_architecture_exmples/bloc/item_list/bloc.dart';
import 'package:flutter_architecture_exmples/bloc/providers/app_scope.dart';
import 'package:flutter_architecture_exmples/datasource/items_repository.dart';
import 'package:flutter_architecture_exmples/home/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScopeProvider(
      itemListBloc: ItemListBloc(ItemsRepository()),
      child: MaterialApp(
        title: "Flutter Demo",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}

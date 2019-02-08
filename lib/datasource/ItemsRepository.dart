import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_exmples/datasource/ListItem.dart';

class ItemsRepository {

  List<IconData> availableIcons;

  List<ListItem> items;

  ItemsRepository._internal() {
    availableIcons = List.from([
      Icons.phone,
      Icons.star,
      Icons.access_alarm,
      Icons.description,
      Icons.accessibility,
      Icons.ac_unit,
    ]);

    var names = List<String>()
      ..addAll([
        "Tommy",
        "Belly",
        "Swimsuit",
        "Cluster",
        "Moloc",
        "Vue"
      ]);

    items = new List.generate(names.length, (index) => ListItem(names[index], Icons.build));
  }

  static final ItemsRepository _instance = new ItemsRepository._internal();

  factory ItemsRepository() {
    return _instance;
  }

}

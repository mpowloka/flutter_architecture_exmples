import 'package:flutter/material.dart';
import 'package:flutter_architecture_exmples/datasource/list_item.dart';
import 'package:rxdart/rxdart.dart';

class ItemsRepository {
  int _maxItemId = 0;
  List<IconData> _availableIcons;
  List<ListItem> _items;

  final BehaviorSubject<List<ListItem>> _listItemsSink = BehaviorSubject();
  Stream<List<ListItem>> listItems;

  final BehaviorSubject<List<IconData>> _availableIconsSink = BehaviorSubject();
  Stream<List<IconData>> availableIcons;

  addListItem(String name, IconData icon) {
    _items.add(new ListItem(_items.length, name, icon));
    _listItemsSink.add(_items);
  }

  editListItem(ListItem item) {
    var indexToReplace =
        _items.indexWhere((testedItem) => testedItem.id == item.id);

    if (indexToReplace > 0 && indexToReplace < _items.length) {
      _items[indexToReplace] = item;
      _listItemsSink.add(_items);
    }
  }

  deleteListItem(ListItem item) {
    var indexToDelete =
        _items.indexWhere((testedItem) => testedItem.id == item.id);

    if (indexToDelete > 0 && indexToDelete < _items.length) {
      _items.removeAt(indexToDelete);
      _listItemsSink.add(_items);
    }
  }

  ItemsRepository._internal() {
    _availableIcons = List.from([
      Icons.phone,
      Icons.star,
      Icons.access_alarm,
      Icons.description,
      Icons.accessibility,
      Icons.ac_unit,
      Icons.verified_user,
      Icons.brightness_3,
      Icons.zoom_out_map
    ]);

    var names = List<String>()
      ..addAll([
        "Renovate dungeon number 42",
        "Sign out of Flutter Meetup",
        "Build Deathstar (so cliché)",
        "Make up your bed",
        "Learn how to pronounce Lynyrd Skynyrd",
        "Learn how to design better UI"
      ]);

    _items = new List.generate(
      names.length,
      (index) => ListItem(_maxItemId++, names[index], Icons.build),
    );

    _listItemsSink.add(_items);
    listItems = _listItemsSink.distinct();

    _availableIconsSink.add(_availableIcons);
    availableIcons = _availableIconsSink.distinct();
  }

  static final ItemsRepository _instance = new ItemsRepository._internal();

  factory ItemsRepository() {
    return _instance;
  }
}

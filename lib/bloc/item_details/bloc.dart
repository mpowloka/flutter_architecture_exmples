import 'package:flutter/material.dart';
import 'package:flutter_architecture_exmples/datasource/list_item.dart';
import 'package:rxdart/rxdart.dart';

class ItemDetailsBloc {
  BehaviorSubject<IconData> selectedIconSubject;
  BehaviorSubject<String> typedNameSubject;
  BehaviorSubject<NameAndIcon> _typedNameWithSelectedIconSubject;

  Stream<NameAndIcon> typedNameWithSelectedIcon;

  final ListItem initialItem;

  ItemDetailsBloc({this.initialItem}) {
    selectedIconSubject = BehaviorSubject();
    typedNameSubject = BehaviorSubject();
    _typedNameWithSelectedIconSubject = BehaviorSubject();

    if (initialItem != null) {
      selectedIconSubject.add(initialItem.icon);
      typedNameSubject.add(initialItem.name);
    } else {
      selectedIconSubject.add(Icons.close);
      typedNameSubject.add("");
    }

    Observable.combineLatest2(
        selectedIconSubject.stream,
        typedNameSubject.stream,
            (icon, name) => NameAndIcon(name, icon)).listen((nameAndIcon) =>
        _typedNameWithSelectedIconSubject.add(nameAndIcon),);

    typedNameWithSelectedIcon = _typedNameWithSelectedIconSubject.stream;
  }

  dispose() {
    selectedIconSubject.close();
    typedNameSubject.close();
  }
}

class NameAndIcon {
  final String name;
  final IconData icon;

  NameAndIcon(this.name, this.icon);
}

import 'package:flutter/material.dart';
import 'package:flutter_architecture_exmples/bloc/item_list/bloc.dart';

class AppScopeProvider extends InheritedWidget {
  final ItemListBloc itemListBloc;

  AppScopeProvider(
      {Key key, @required Widget child, @required this.itemListBloc})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  static ItemListBloc itemListBlockOf(BuildContext context) {
    return (context.ancestorWidgetOfExactType(AppScopeProvider)
            as AppScopeProvider)
        .itemListBloc;
  }
}

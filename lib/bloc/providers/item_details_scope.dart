import 'package:flutter/material.dart';
import 'package:flutter_architecture_exmples/bloc/item_details/bloc.dart';

class ItemDetailsScopeProvider extends InheritedWidget {
  final ItemDetailsBloc itemDetailsBloc;

  ItemDetailsScopeProvider(
      {Key key, @required Widget child, @required this.itemDetailsBloc})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  static ItemDetailsBloc itemDetailsBlocOf(BuildContext context) {
    return (context.ancestorWidgetOfExactType(ItemDetailsScopeProvider) as ItemDetailsScopeProvider).itemDetailsBloc;
  }
}

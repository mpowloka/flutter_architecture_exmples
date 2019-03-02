import 'package:flutter/material.dart';
import 'package:flutter_architecture_exmples/datasource/items_repository.dart';
import 'package:flutter_architecture_exmples/datasource/list_item.dart';
import 'package:flutter_architecture_exmples/mvp/item_list/item_list_contract.dart';
import 'package:flutter_architecture_exmples/mvp/navigation/routes.dart';

class ItemListPresenterImpl implements ItemListPresenter {
  ItemListView _view;

  @override
  set view(ItemListView view) {
    _view = view;
    ItemsRepository().listItems.listen((items) {
      _view.bindItems(items);
    });
  }

  @override
  void onFabClicked(BuildContext context) {
    Navigator.push(context, MvpRoutes.getAddItemRoute());
  }

  @override
  void onItemLongPressed(BuildContext context, ListItem item) {
    Navigator.push(context, MvpRoutes.getEditItemRoute(item));
  }
}

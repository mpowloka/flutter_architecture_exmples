import 'package:flutter/material.dart';
import 'package:flutter_architecture_exmples/datasource/list_item.dart';

abstract class ItemListView {

  void bindItems(List<ListItem> items);

}

abstract class ItemListPresenter {

  set view(ItemListView view);

  void onFabClicked(BuildContext context);

  void onItemLongPressed(BuildContext context, ListItem item);

}
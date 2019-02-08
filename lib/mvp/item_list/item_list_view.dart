import 'package:flutter_architecture_exmples/datasource/ListItem.dart';

abstract class ItemListView {

  void bindItems(List<ListItem> items);

}

abstract class ItemListViewPresenter {

  ItemListView view;

  void onItemLongPressed(ListItem item);

  void onFabClicked();

}
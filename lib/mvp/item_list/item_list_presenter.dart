import 'package:flutter_architecture_exmples/datasource/ListItem.dart';
import 'package:flutter_architecture_exmples/mvp/item_list/item_list_view.dart';

class ItemListPresenter implements ItemListViewPresenter{

  @override
  ItemListView view;

  @override
  void onFabClicked() {
    // TODO: implement onFabClicked
  }

  @override
  void onItemLongPressed(ListItem item) {
    // TODO: implement onItemLongPressed
  }

}
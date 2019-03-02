import 'package:flutter/material.dart';
import 'package:flutter_architecture_exmples/datasource/list_item.dart';
import 'package:flutter_architecture_exmples/mvp/item_details/item_adding_presenter.dart';
import 'package:flutter_architecture_exmples/mvp/item_details/item_details_view.dart';
import 'package:flutter_architecture_exmples/mvp/item_details/item_editing_presenter.dart';
import 'package:flutter_architecture_exmples/mvp/item_list/item_list_presenter.dart';
import 'package:flutter_architecture_exmples/mvp/item_list/item_list_view.dart';

class MvpRoutes {
  static MaterialPageRoute getEditItemRoute(ListItem item) {
    return MaterialPageRoute(
        builder: (context) => ItemDetailsMvpScreen(
              presenter: ItemEditingPresenter(item),
            ));
  }

  static MaterialPageRoute getAddItemRoute() {
    return MaterialPageRoute(
        builder: (context) => ItemDetailsMvpScreen(
              presenter: ItemAddingPresenter(),
            ));
  }

  static MaterialPageRoute getListOfItemsRoute() {
    return MaterialPageRoute(
        builder: (context) => ItemListMvpScreen(
              presenter: ItemListPresenterImpl(),
            ));
  }
}

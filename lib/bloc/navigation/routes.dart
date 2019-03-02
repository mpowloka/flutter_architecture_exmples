import 'package:flutter/material.dart';
import 'package:flutter_architecture_exmples/bloc/item_details/bloc.dart';
import 'package:flutter_architecture_exmples/bloc/item_details/view.dart';
import 'package:flutter_architecture_exmples/bloc/item_list/view.dart';
import 'package:flutter_architecture_exmples/bloc/providers/app_scope.dart';
import 'package:flutter_architecture_exmples/bloc/providers/item_details_scope.dart';
import 'package:flutter_architecture_exmples/datasource/list_item.dart';

class BlocRoutes {
  static MaterialPageRoute getListOfItemsRoute() {
    return MaterialPageRoute(builder: (context) => ItemListBlocScreen());
  }

  static MaterialPageRoute getEditListItemRoute(ListItem initialItem) {
    return MaterialPageRoute(builder: (context) {
      var itemListBloc = AppScopeProvider.itemListBlockOf(context);
      return ItemDetailsScopeProvider(
        child: ItemDetailsBlocScreen(
          onFabTapped: (ListItem item) {
            itemListBloc.editListItem(item);
          },
          onDeleteClicked: (ListItem item) {
            itemListBloc.deleteListItem(item);
          },
          appBarTitle: "Edit item",
          initialItemName: initialItem.name,
        ),
        itemDetailsBloc: ItemDetailsBloc(initialItem: initialItem),
      );
    });
  }

  static MaterialPageRoute getAddListItemRoute() {
    return MaterialPageRoute(builder: (context) {
      var itemListBloc = AppScopeProvider.itemListBlockOf(context);
      return ItemDetailsScopeProvider(
        child: ItemDetailsBlocScreen(
          onFabTapped: (ListItem item) {
            itemListBloc.addListItem(item.name, item.icon);
          },
          appBarTitle: "Add item",
        ),
        itemDetailsBloc: ItemDetailsBloc(),
      );
    });
  }
}

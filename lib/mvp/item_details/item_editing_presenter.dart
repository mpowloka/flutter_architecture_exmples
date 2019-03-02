import 'package:flutter/material.dart';
import 'package:flutter_architecture_exmples/datasource/items_repository.dart';
import 'package:flutter_architecture_exmples/datasource/list_item.dart';
import 'package:flutter_architecture_exmples/mvp/item_details/item_details_contract.dart';

class ItemEditingPresenter implements ItemDetailsPresenter {
  final ListItem _editedItem;
  ItemDetailsView _view;

  ItemEditingPresenter(this._editedItem);

  @override
  set view(ItemDetailsView view) {
    _view = view;
  }

  @override
  onViewInit() {
    _view.setAppBarTitle("Edit item");
    _view.setItemName(_editedItem.name);
    _view.setSelectedIcon(_editedItem.icon);
    _view.displayDeleteAction(true);

    ItemsRepository().availableIcons.listen((availableIcons) {
      _view.bindIcons(availableIcons);
    });
  }

  @override
  void onFabClicked(BuildContext context) {
    _editedItem.name = _view.getTypedName();
    _editedItem.icon = _view.getSelectedIcon();
    ItemsRepository().editListItem(_editedItem);
    Navigator.pop(context);
  }

  @override
  void onIconClicked(IconData icon) {
    _view.setSelectedIcon(icon);
  }

  @override
  void onDeleteClicked(BuildContext context) {
    ItemsRepository().deleteListItem(_editedItem);
    Navigator.pop(context);
  }
}

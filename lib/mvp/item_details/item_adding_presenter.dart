import 'package:flutter/material.dart';
import 'package:flutter_architecture_exmples/datasource/items_repository.dart';
import 'package:flutter_architecture_exmples/mvp/item_details/item_details_contract.dart';

class ItemAddingPresenter implements ItemDetailsPresenter {
  ItemDetailsView _view;

  @override
  set view(ItemDetailsView view) {
    _view = view;
  }

  @override
  onViewInit() {
    _view.setAppBarTitle("Add item");

    ItemsRepository().availableIcons.listen((availableIcons) {
      _view.bindIcons(availableIcons);
    });

    ItemsRepository().availableIcons.first.then((availableIcons) {
      _view.setSelectedIcon(availableIcons[0]);
    });
  }

  @override
  void onFabClicked(BuildContext context) {
    ItemsRepository().addListItem(
      _view.getTypedName(),
      _view.getSelectedIcon(),
    );
    Navigator.pop(context);
  }

  @override
  void onIconClicked(IconData icon) {
    _view.setSelectedIcon(icon);
  }

  @override
  void onDeleteClicked(BuildContext context) {}
}

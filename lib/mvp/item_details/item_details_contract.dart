import 'package:flutter/material.dart';

abstract class ItemDetailsView {
  bindIcons(List<IconData> icons);

  setSelectedIcon(IconData icon);

  setItemName(String name);

  setAppBarTitle(String title);

  displayDeleteAction(bool display);

  String getTypedName();

  IconData getSelectedIcon();
}

abstract class ItemDetailsPresenter {
  set view(ItemDetailsView view);

  onViewInit();

  onIconClicked(IconData icon);

  onFabClicked(BuildContext context);

  onDeleteClicked(BuildContext context);
}

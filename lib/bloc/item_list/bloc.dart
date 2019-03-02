import 'package:flutter/cupertino.dart';
import 'package:flutter_architecture_exmples/datasource/items_repository.dart';
import 'package:flutter_architecture_exmples/datasource/list_item.dart';

class ItemListBloc {
  final ItemsRepository itemsRepository;

  Stream<List<ListItem>> items;
  Stream<List<IconData>> availableIcons;

  ItemListBloc(this.itemsRepository) {
    items = itemsRepository.listItems;
    availableIcons = itemsRepository.availableIcons;
  }

  editListItem(ListItem item) {
    itemsRepository.editListItem(item);
  }

  deleteListItem(ListItem item) {
    itemsRepository.deleteListItem(item);
  }

  addListItem(String name, IconData icon) {
    itemsRepository.addListItem(name, icon);
  }
}

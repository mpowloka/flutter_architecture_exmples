import 'package:flutter/material.dart';
import 'package:flutter_architecture_exmples/datasource/ItemsRepository.dart';
import 'package:flutter_architecture_exmples/datasource/ListItem.dart';
import 'package:flutter_architecture_exmples/mvp/item_list/item_list_view.dart';

class ItemListMvpScreen extends StatefulWidget {
  final ItemListViewPresenter presenter;

  @override
  ItemListMvpScreenState createState() {
    return ItemListMvpScreenState();
  }

  const ItemListMvpScreen({Key key, this.presenter}) : super(key: key);
}

class ItemListMvpScreenState extends State<ItemListMvpScreen>
    implements ItemListView {
  List<ListItem> items = List();

  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MVP Example"),
      ),
      body: ListView.builder(
          itemCount: ItemsRepository().items.length,
          itemBuilder: (context, index) {
            var item = ItemsRepository().items[index];

            return ListTile(
              leading: Icon(item.icon),
              title: Text(item.itemName),
              onLongPress: () => widget.presenter.onItemLongPressed(item),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => widget.presenter.onFabClicked(),
      ),
    );
  }

  @override
  void bindItems(List<ListItem> items) => setState(() {
        this.items = items;
      });
}

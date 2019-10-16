import 'package:flutter/material.dart';
import 'package:flutter_architecture_exmples/datasource/list_item.dart';
import 'package:flutter_architecture_exmples/mvp/item_list/item_list_contract.dart';
import 'package:flutter_architecture_exmples/mvp/navigation/routes.dart';

class ItemListMvpScreen extends StatefulWidget {
  final ItemListPresenter presenter;

  ItemListMvpScreen({Key key, this.presenter});

  @override
  _ItemListMvpScreenState createState() => _ItemListMvpScreenState();
}

class _ItemListMvpScreenState extends State<ItemListMvpScreen>
    implements ItemListView {
  List<ListItem> _items = [];


  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mvp example"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => _itemListTile(index, context),
          separatorBuilder: (context, index) => Divider(),
          itemCount: _items.length),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          widget.presenter.onFabClicked(context);
        },
      ),
    );
  }

  @override
  void bindItems(List<ListItem> items) => setState(() {
        _items = items;
      });

  ListTile _itemListTile(int index, BuildContext context) {
    final item = _items[index];
    return ListTile(
      leading: Icon(item.icon),
      title: Text(item.name),
      onLongPress: () {
        widget.presenter.onItemLongPressed(context, item);
      },
    );
  }
}

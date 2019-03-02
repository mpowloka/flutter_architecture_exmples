import 'package:flutter/material.dart';
import 'package:flutter_architecture_exmples/datasource/list_item.dart';
import 'package:flutter_architecture_exmples/mvp/item_list/item_list_contract.dart';

class ItemListMvpScreen extends StatefulWidget {
  final ItemListPresenter presenter;

  @override
  ItemListMvpScreenState createState() {
    return ItemListMvpScreenState();
  }

  const ItemListMvpScreen({Key key, @required this.presenter})
      : super(key: key);
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
      body: ListView.separated(
          itemCount: items.length,
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemBuilder: (context, index) {
            var item = items[index];
            return ListTile(
              leading: Icon(item.icon),
              title: Text(item.name),
              onLongPress: () =>
                  widget.presenter.onItemLongPressed(context, item),
            );
          }).build(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () => widget.presenter.onFabClicked(context),
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void bindItems(List<ListItem> items) => setState(() {
        this.items = items;
      });
}

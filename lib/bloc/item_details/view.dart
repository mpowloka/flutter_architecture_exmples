import 'package:flutter/material.dart';
import 'package:flutter_architecture_exmples/bloc/item_details/bloc.dart';
import 'package:flutter_architecture_exmples/bloc/item_list/bloc.dart';
import 'package:flutter_architecture_exmples/bloc/providers/app_scope.dart';
import 'package:flutter_architecture_exmples/bloc/providers/item_details_scope.dart';
import 'package:flutter_architecture_exmples/datasource/list_item.dart';

class ItemDetailsBlocScreen extends StatefulWidget {
  final Function onFabTapped;
  final Function onDeleteClicked;
  final String appBarTitle;
  final String initialItemName;

  const ItemDetailsBlocScreen(
      {Key key, this.onFabTapped, this.onDeleteClicked, this.appBarTitle, this.initialItemName})
      : super(key: key);

  @override
  ItemDetailsBlocScreenState createState() {
    return new ItemDetailsBlocScreenState();
  }
}

class ItemDetailsBlocScreenState extends State<ItemDetailsBlocScreen> {
  ItemListBloc itemListBloc;
  ItemDetailsBloc itemDetailsBloc;
  TextEditingController _textEditingController;


  @override
  void initState() {
    super.initState();

    _textEditingController = TextEditingController();
    _textEditingController.text = widget.initialItemName;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    itemListBloc = AppScopeProvider.itemListBlockOf(context);
    itemDetailsBloc = ItemDetailsScopeProvider.itemDetailsBlocOf(context);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    itemDetailsBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(context),
      floatingActionButton: buildFab(context),
    );
  }

  FloatingActionButton buildFab(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.check),
      onPressed: () {
        itemDetailsBloc.typedNameWithSelectedIcon.listen((nameAndIcon) {
          var itemId = itemDetailsBloc.initialItem != null
              ? itemDetailsBloc.initialItem.id
              : -1;
          widget.onFabTapped(
              ListItem(itemId, nameAndIcon.name, nameAndIcon.icon));
          Navigator.pop(context);
        });
      },
    );
  }

  Column buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 48, left: 16, right: 16),
          child: Row(
            children: <Widget>[
              StreamBuilder(
                stream: itemDetailsBloc.selectedIconSubject,
                builder: (context, snapshot) {
                  return Icon(snapshot.data);
                }
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    onChanged: (text) =>
                        itemDetailsBloc.typedNameSubject.add(text),
                    controller: _textEditingController,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 16), child: Divider()),
        SizedBox(
          height: 80,
          child: StreamBuilder(
            stream: itemListBloc.availableIcons,
            initialData: <IconData>[],
            builder: (context, snapshot) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: IconButton(
                          icon: Icon(snapshot.data[index]),
                          onPressed: () => itemDetailsBloc.selectedIconSubject
                              .add(snapshot.data[index])),
                    ),
              ).build(context);
            },
          ),
        )
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(widget.appBarTitle),
      actions: widget.onDeleteClicked != null
          ? <Widget>[
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  widget.onDeleteClicked(itemDetailsBloc.initialItem);
                  Navigator.pop(context);
                },
              ),
            ]
          : <Widget>[],
    );
  }
}

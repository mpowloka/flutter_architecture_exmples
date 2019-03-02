import 'package:flutter/material.dart';
import 'package:flutter_architecture_exmples/mvp/item_details/item_details_contract.dart';

class ItemDetailsMvpScreen extends StatefulWidget {
  final ItemDetailsPresenter presenter;

  @override
  ItemDetailsMvpScreenState createState() {
    return new ItemDetailsMvpScreenState(presenter);
  }

  const ItemDetailsMvpScreen({Key key, @required this.presenter})
      : super(key: key);
}

class ItemDetailsMvpScreenState extends State<ItemDetailsMvpScreen>
    implements ItemDetailsView {
  final ItemDetailsPresenter presenter;

  String _appBarTitle = "";
  IconData _selectedIcon;
  List<IconData> _icons = List();
  bool _showDeleteAction = false;

  TextEditingController _textEditingController;

  ItemDetailsMvpScreenState(this.presenter);

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    presenter.view = this;
    presenter.onViewInit();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    presenter.view = this;

    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(context),
      floatingActionButton: buildFab(context),
    );
  }

  FloatingActionButton buildFab(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () => presenter.onFabClicked(context));
  }

  Column buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 48, left: 16, right: 16),
          child: Row(
            children: <Widget>[
              Icon(_selectedIcon),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
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
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _icons.length,
            itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: IconButton(
                    icon: Icon(_icons[index]),
                    onPressed: () => presenter.onIconClicked(_icons[index]),
                  ),
                ),
          ).build(context),
        )
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(_appBarTitle),
      actions: _showDeleteAction
          ? <Widget>[
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => presenter.onDeleteClicked(context),
              )
            ]
          : <Widget>[],
    );
  }

  @override
  void bindIcons(List<IconData> icons) => setState(() {
        _icons = icons;
      });

  @override
  void setSelectedIcon(IconData icon) => setState(() {
        _selectedIcon = icon;
      });

  @override
  void setAppBarTitle(String title) => setState(() {
        _appBarTitle = title;
      });

  @override
  void setItemName(String name) {
    _textEditingController.text = name;
  }

  @override
  void displayDeleteAction(bool display) => setState(() {
        _showDeleteAction = display;
      });

  @override
  String getTypedName() => _textEditingController.text;

  @override
  IconData getSelectedIcon() => _selectedIcon;

}

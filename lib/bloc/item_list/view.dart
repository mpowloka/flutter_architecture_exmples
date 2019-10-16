import 'package:flutter/material.dart';
import 'package:flutter_architecture_exmples/bloc/navigation/routes.dart';
import 'package:flutter_architecture_exmples/bloc/providers/app_scope.dart';
import 'package:flutter_architecture_exmples/datasource/list_item.dart';

class ItemListBlocScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemListBlock = AppScopeProvider.itemListBlockOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("BLoC Example"),
      ),
      body: StreamBuilder(
          stream: itemListBlock.items,
          initialData: <ListItem>[],
          builder: (context, snapshot) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  final item = snapshot.data[index];
                  return ListTile(
                      leading: Icon(item.icon),
                      title: Text(item.name),
                      onLongPress: () {
                        Navigator.of(context)
                            .push(BlocRoutes.getEditListItemRoute(item));
                      });
                },
                separatorBuilder: (context, index) => Divider(),
                itemCount: snapshot.data.length);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(BlocRoutes.getAddListItemRoute());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

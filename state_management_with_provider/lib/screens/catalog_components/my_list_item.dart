import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_with_provider/models/catalog.dart';
import 'package:state_management_with_provider/screens/catalog_components/add_buttom.dart';

class MyListItem extends StatelessWidget {
  final int index;

  MyListItem(this.index, {Key key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    var item = context.select<CatalogModel, Item>(
          (catalog) => catalog.getByPosition(index),
    );
    var textTheme = Theme
        .of(context)
        .textTheme
        .headline1;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: item.color,
              ),
            ),
            SizedBox(width: 24),
            Expanded(child: Text(item.name, style: textTheme),
            ),
            SizedBox(width: 24),
            AddButtom(item: item),
          ],
        ),
      ),
    );
  }
}
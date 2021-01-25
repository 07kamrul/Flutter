import 'package:flutter/material.dart';
import 'package:state_management_with_provider/screens/catalog_components/my_appbar.dart';
import 'package:state_management_with_provider/screens/catalog_components/my_list_item.dart';

class MyCatalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          MyAppBar(),
          SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => MyListItem(index)),
          )
        ],
      ),
    );
  }
}

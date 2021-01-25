import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_with_provider/models/catalog.dart';
import 'package:state_management_with_provider/screens/cart.dart';
import 'package:state_management_with_provider/screens/catalog.dart';
import 'package:state_management_with_provider/screens/login.dart';

import 'common/theme.dart';
import 'models/cart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => CatalogModel()),
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
            create: (context) => CartModel(),
            update: (context, catalog, cart){
              cart.catalog = catalog;
              return cart;
            },
        ),
      ],
      child: MaterialApp(
        title: 'Provider Demo',
        theme: appTheme,
          initialRoute: '/',
        routes: {
          '/':(context) => MyLogin(),
          '/catalog':(context) => MyCatalog(),
          '/cart':(context) => MyCart(),
        },
      ),
    );
  }
}

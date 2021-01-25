import 'package:flutter/material.dart';
import 'package:state_management_with_provider/models/cart.dart';
import 'package:state_management_with_provider/models/catalog.dart';
import 'package:provider/provider.dart';

class AddButtom extends StatelessWidget{
  final Item item;
  const AddButtom({Key key, @required this.item}): super(key: key);

  @override
  Widget build(BuildContext context) {
    var isInCart = context.select<CartModel, bool>(
          (cart) => cart.items.contains(item),
    );

    return FlatButton(onPressed: isInCart ? null : (){
      var cart = context.read<CartModel>();
      cart.add(item);
    },
      splashColor: Theme.of(context).primaryColor,
      child: isInCart ? Icon(Icons.check, semanticLabel: 'ADDED'): Text('ADD'),
    );
  }
}
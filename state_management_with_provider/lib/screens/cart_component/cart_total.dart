import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_with_provider/models/cart.dart';

class CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var hugeStyle =
        Theme.of(context).textTheme.headline1.copyWith(fontSize: 48);

    return SizedBox(
      height: 200,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CartModel>(
              builder: (context, cart, child) => Text(
                '\$${cart.totalPrice}',
                style: hugeStyle,
              ),
            ),
            SizedBox(width: 24),
            FlatButton(
            onPressed: (){
              Scaffold.of(context).showSnackBar(SnackBar(content: Text('Buying not supported yet.')));
            },
              color: Colors.white,
              child: Text('Buy'),
            )
          ],
        ),
      ),
    );
  }
}

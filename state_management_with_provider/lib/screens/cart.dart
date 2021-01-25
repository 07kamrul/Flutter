import 'package:flutter/material.dart';
import 'package:state_management_with_provider/screens/cart_component/cart_list.dart';
import 'package:state_management_with_provider/screens/cart_component/cart_total.dart';

class MyCart extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart', style: Theme.of(context).textTheme.headline1,),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.yellow,
        child: Column(
          children: [
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: CartList(),
                ),
            ),
            Divider(height:4, color: Colors.black), CartTotal()
          ],
        ),
      ),
    );
  }
}
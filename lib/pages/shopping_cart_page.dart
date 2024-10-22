import 'package:flutter/material.dart';

class ShoppingCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: Center(
        child: Text(
          'Shopping Cart Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

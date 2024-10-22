import 'package:flutter/material.dart';

class BusinessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Business'),
      ),
      body: Center(
        child: Text(
          'Business Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

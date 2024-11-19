import 'package:flutter/material.dart';

class BusinessPage extends StatelessWidget {
  const BusinessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Business'),
      ),
      body: const Center(
        child: Text(
          'Business Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

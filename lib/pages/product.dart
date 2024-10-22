import 'package:appflutter/util/fun_collection.dart';
import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product'),
      ),
      body: ProductList(

      ),
    );
  }
}

class ProductList extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Produk 1',
      'price': 'Rp 100.000',
      'sold': '10 Terjual',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'name': 'Produk 2',
      'price': 'Rp 150.000',
      'sold': '5 Terjual',
      'image': 'https://via.placeholder.com/150',
    },
  ];

  ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Produk'),
      ),
      body: GridBuilderDuaKolom(items: products), // Tambahkan titik koma di sini
    );
  }
}

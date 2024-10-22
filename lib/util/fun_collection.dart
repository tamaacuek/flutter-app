import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Image.network(product['image'], fit: BoxFit.cover),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product['name'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(product['price']),
                      ],
                    ),
                    Text(
                      'Sold: ${product['sold']}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GridBuilderDuaKolom extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  const GridBuilderDuaKolom({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Dua kolom
        childAspectRatio: 3 / 4, // Mengatur rasio card
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ProductCard(product: items[index]);
      },
    );
  }
}

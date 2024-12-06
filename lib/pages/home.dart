import 'package:flutter/material.dart';
import 'history_page.dart';
import 'shopping_cart_page.dart';
import 'business_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final List<String> names = [
    'Tama',
    'Aisyah',
    'Valen',
    'Aria',
    'Melky',
    'Hezran',
    'Theo',
    'Dion',
    'Baim',
    'Joko',
    'Kiki',
    'Lina',
    'Mira'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 250,
            child: ClipRRect(
              child: Image.network(
                'https://images.unsplash.com/photo-1682744210681-ba342a476218?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HistoryPage()),
                    );
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.brown,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: const Icon(
                      Icons.history,
                      color: Colors.white,
                      size: 30.0,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ShoppingCartPage()),
                    );
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.brown,
                      shape: BoxShape.rectangle,
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: const Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                      size: 30.0,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BusinessPage()),
                    );
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.brown,
                      shape: BoxShape.rectangle,
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: const Icon(
                      Icons.business,
                      color: Colors.white,
                      size: 30.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: names.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(names[index]),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

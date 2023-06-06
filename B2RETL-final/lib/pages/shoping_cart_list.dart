import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ShoppingCartList extends StatefulWidget {
  const ShoppingCartList({super.key});

  @override
  State<ShoppingCartList> createState() => _ShoppingCartListState();
}

class _ShoppingCartListState extends State<ShoppingCartList> {
  final List<Product> products = [
    Product('Product 1', 'Description 1', 10.99),
    Product('Product 2', 'Description 2', 9.99),
    Product('Product 3', 'Description 3', 12.99),
    Product('Product 4', 'Description 4', 8.99),
    Product('Product 5', 'Description 5', 11.99),
    Product('Product 6', 'Description 6', 7.99),
    Product('Product 1', 'Description 1', 10.99),
    Product('Product 2', 'Description 2', 9.99),
    Product('Product 3', 'Description 3', 12.99),
    Product('Product 4', 'Description 4', 8.99),
    Product('Product 5', 'Description 5', 11.99),
    Product('Product 6', 'Description 6', 7.99),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
        actions: [
          IconButton(
              onPressed: () => {},
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(products[index].name),
                    subtitle: Text(products[index].description),
                    trailing: TextButton(
                      child: const Text(
                        'Remove',
                        style: TextStyle(color: Colors.red),
                      ),
                      onPressed: () {
                        print('Added ${products[index].name} to cart.');
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Place order'),
            ),
          ),
        ],
      ),
    );
  }
}

class Product {
  final String name;
  final String description;
  final double price;

  Product(this.name, this.description, this.price);
}

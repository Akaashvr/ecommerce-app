import 'package:b2retl/pages/shoping_cart_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<Product> products = [
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
        title: const Text('Product List'),
        actions: [
          IconButton(
              onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ShoppingCartList()),
                    )
                  },
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ))
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(products[index].name),
              subtitle: Text(products[index].description),
              trailing: TextButton(
                child: const Text('Add to Cart'),
                onPressed: () {
                  print("sdfdd");
                },
              ),
            ),
          );
        },
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

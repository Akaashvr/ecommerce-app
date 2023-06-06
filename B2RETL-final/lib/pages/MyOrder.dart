import 'package:b2retl/pages/shoping_cart_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({super.key});

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
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
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(products[index].description),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Shop Name",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              trailing: Text("Rs" + products[index].price.toStringAsFixed(2)),
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

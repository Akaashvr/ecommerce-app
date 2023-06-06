import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class ShopList extends StatefulWidget {
  const ShopList({super.key});

  @override
  State<ShopList> createState() => _ShopListState();
}

class Shop {
  final String name;
  final String address;
  final String contact;

  Shop({required this.name, required this.address, required this.contact});
}

class _ShopListState extends State<ShopList> {
  final List<Shop> _shops = [
    Shop(name: 'Shop 1', address: '123 Main St, Anytown', contact: '555-1234'),
    Shop(name: 'Shop 2', address: '456 Elm St, Anytown', contact: '555-5678'),
    Shop(name: 'Shop 3', address: '789 Oak St, Anytown', contact: '555-9012'),
    Shop(name: 'Shop 1', address: '123 Main St, Anytown', contact: '555-1234'),
    Shop(name: 'Shop 2', address: '456 Elm St, Anytown', contact: '555-5678'),
    Shop(name: 'Shop 3', address: '789 Oak St, Anytown', contact: '555-9012'),
    Shop(name: 'Shop 1', address: '123 Main St, Anytown', contact: '555-1234'),
    Shop(name: 'Shop 2', address: '456 Elm St, Anytown', contact: '555-5678'),
    Shop(name: 'Shop 3', address: '789 Oak St, Anytown', contact: '555-9012'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shop'),
      ),
      body: ListView.builder(
        itemCount: _shops.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(_shops[index].name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_shops[index].address),
                  Text(_shops[index].contact),
                ],
              ),
              trailing: IconButton(
                icon: Icon(Icons.call),
                onPressed: () {
                  //TODO: Implement call functionality
                  print(
                      'Calling ${_shops[index].name} at ${_shops[index].contact}');
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

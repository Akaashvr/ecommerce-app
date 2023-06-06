import 'package:b2retl/pages/imagebuttongrid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'image_card.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  void handleImageTap(int index) {
    print('Image tapped: $index');
  }

  final List<String> categories = [
    'Clothing',
    'Electronics',
    'Beauty',
    'Home',
    'Sports',
    'Toys',
    'Food',
    'Books'
  ];
  final List<String> imgcat = [
    'assets/png/004-shirts.png',
    'assets/png/001-electronics.png',
    'assets/png/008-cosmetics-1.png',
    'assets/png/011-home.png',
    'assets/png/012-sports.png',
    'assets/png/015-toys.png',
    'assets/png/017-diet.png',
    'assets/png/021-book-stack.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ImageCard(imagePath: 'assets/png/R.jpg'),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/products');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            Center(
                              child: Text(
                                categories[index],
                                style: const TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Expanded(child: Image.asset(imgcat[index])),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: const Text("John Doe"),
                accountEmail: const Text("johndoe@example.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.asset('assets/png/logo-no-background.png'),
                ),
              ),
              // const DrawerHeader(
              //   decoration: BoxDecoration(color: Color(0xff0718c5)),
              //   child: Text('Drawer Header'),
              // ),
              ListTile(
                title: const Text('Home'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: const Text('My Profile'),
                onTap: () {
                  Navigator.pushNamed(context, '/profile');
                },
              ),
              ListTile(
                title: const Text('My Orders'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.pushNamed(context, '/order');
                },
              ),
              ListTile(
                title: const Text('My Shop'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.pushNamed(context, '/shopList');
                },
              ),
              ListTile(
                title: const Text('Add Shop'),
                onTap: () {
                  Navigator.pushNamed(context, '/addShop');
                },
              ),
              ListTile(
                title: const Text('About Us'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.pushNamed(context, '/about');
                },
              ),
              ListTile(
                title: const Text('Help and Support'),
                onTap: () {
                  Navigator.pushNamed(context, '/helpAndSupport');
                },
              ),
            ],
          ),
        ));
  }
}

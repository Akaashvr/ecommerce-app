import 'package:flutter/material.dart';

class RetailerAboutUsPage extends StatelessWidget {
  const RetailerAboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About Our Company',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'We are a family-owned retailer that has been serving our community for over 50 years. Our mission is to provide high-quality products at fair prices, with exceptional customer service.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Our Products',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'We specialize in a wide range of products, including clothing, shoes, accessories, home goods, and more. Our inventory is constantly changing to reflect the latest trends and styles, so be sure to check back often!',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Contact Us',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'You can reach us by phone at (555) 123-4567, or by email at info@retailer.com. Our store is located at 123 Main Street, Anytown, USA.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

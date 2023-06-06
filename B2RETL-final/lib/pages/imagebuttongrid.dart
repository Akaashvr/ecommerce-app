import 'package:flutter/material.dart';

class ImageButtonGrid extends StatelessWidget {
  final List<String> imagePaths;
  final Function(int) onTap;

  const ImageButtonGrid(
      {super.key, required this.imagePaths, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2, // Number of columns in the grid
      children: List.generate(imagePaths.length, (index) {
        return GestureDetector(
          onTap: () {
            // Handle button press here
            print('Button $index pressed');
          },
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Ink(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Image.asset(imagePaths[index]),
              ),
            ),
          ),
        );
      }),
    );
  }
}

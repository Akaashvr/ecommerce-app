import 'package:flutter/material.dart';

class AddShop extends StatefulWidget {
  const AddShop({super.key});

  @override
  State<AddShop> createState() => _AddShopState();
}

class _AddShopState extends State<AddShop> {
  final _formKey = GlobalKey<FormState>();
  final _shopNameTextController = TextEditingController();
  final _contactController = TextEditingController();

  @override
  void dispose() {
    _shopNameTextController.dispose();
    _contactController.dispose();
    super.dispose();
  }

  String _selectedOption = "Option 1";
  final List<String> _options = ['Option 1', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Shop'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
                const SizedBox(height: 20),
                Card(
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 10),
                        DropdownButtonFormField<String>(
                          // ignore: prefer_const_constructors
                          decoration: InputDecoration(
                            labelText: 'Enter Area',
                            border: const OutlineInputBorder(),
                          ),
                          value: _selectedOption,
                          items: _options.map((option) {
                            return DropdownMenuItem<String>(
                              value: option,
                              child: Text(option),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedOption = value!;
                            });
                          },
                          validator: (value) {
                            if (value == null) {
                              return 'Please select an option';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _shopNameTextController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter Shop Name'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your shop name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _contactController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Contact'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a contact';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 34),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // const v = _formKey.currentState?.validate();
                              Navigator.pushNamed(
                                context,
                                '/dashboard',
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 24),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text('AddShop'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

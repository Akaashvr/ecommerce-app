import 'package:flutter/material.dart';

class HelpAndSupport extends StatelessWidget {
  const HelpAndSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help and Support'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        children: [
          Text(
            'Frequently Asked Questions',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          _buildQuestionAnswer(
            question: 'What is this app for?',
            answer:
                'This app helps you do something useful or interesting. Fill in your answer here.',
          ),
          _buildQuestionAnswer(
            question: 'How do I get started?',
            answer:
                'To get started, simply follow the instructions on the welcome screen. Fill in your answer here.',
          ),
          _buildQuestionAnswer(
            question: 'How do I contact support?',
            answer:
                'You can contact our support team by filling out the form below or emailing support@HelpAndSupport.com.',
          ),
          SizedBox(height: 32),
          Text(
            'Contact Us',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          TextFormField(
            maxLines: 5,
            decoration: InputDecoration(
              labelText: 'Message',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 32),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Send Message'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionAnswer(
      {required String question, required String answer}) {
    return ExpansionTile(
      title: Text(question),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Text(answer),
        ),
      ],
    );
  }
}

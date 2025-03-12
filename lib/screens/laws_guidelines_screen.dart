import 'package:flutter/material.dart';

class LawsGuidelinesScreen extends StatelessWidget {
  const LawsGuidelinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50], // Light background
      appBar: AppBar(
        title: const Text('Laws & Guidelines', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.amber[800], // Amber app bar
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          Text(
            '1. Store honey in a cool, dry place.',
            style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 231, 139, 19)),
          ),
          SizedBox(height: 10),
          Text(
            '2. Regularly check hives for pests.',
            style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 231, 139, 19)),
          ),
          SizedBox(height: 10),
          Text(
            '3. Ensure proper ventilation in storage areas.',
            style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 231, 139, 19)),
          ),
          SizedBox(height: 10),
          Text(
            '4. Follow local regulations for beekeeping.',
            style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 231, 139, 19)),
          ),
        ],
      ),
    );
  }
}
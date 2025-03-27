import 'package:flutter/material.dart';
import 'package:honey/widgets/bottom_navbar.dart';

class LawsGuidelinesScreen extends StatefulWidget {
  const LawsGuidelinesScreen({super.key});

  @override
  _LawsGuidelinesScreenState createState() => _LawsGuidelinesScreenState();
}

class _LawsGuidelinesScreenState extends State<LawsGuidelinesScreen> {
  int _selectedIndex = 2; // Set the index for Laws & Guidelines

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/inventory');
        break;
      case 2:
        // Already on Laws & Guidelines screen
        break;
      case 3:
        Navigator.pushNamed(context, '/qrscanner');
        break;
      case 4:
        Navigator.pushNamed(context, '/weather');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laws & Guidelines'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Category 1: Rules from Ministry
          const Text(
            'Rules from Ministry',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.amber,
            ),
          ),
          const SizedBox(height: 10),
          _buildRuleItem('1. Store honey in a cool, dry place.'),
          _buildRuleItem('2. Regularly check hives for pests.'),
          _buildRuleItem('3. Ensure proper ventilation in storage areas.'),
          _buildRuleItem('4. Follow local regulations for beekeeping.'),
          const SizedBox(height: 20),

          // Category 2: Guidelines of Honeybee
          const Text(
            'Guidelines of Honeybee',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.amber,
            ),
          ),
          const SizedBox(height: 10),
          _buildRuleItem('1. Use natural methods for pest control.'),
          _buildRuleItem('2. Avoid using chemicals near hives.'),
          _buildRuleItem('3. Provide clean water sources for bees.'),
          _buildRuleItem('4. Monitor hive health regularly.'),
        ],
      ),
      // Add the BottomNavBar here
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  // Helper method to build a rule item
  Widget _buildRuleItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.circle, size: 8, color: Colors.amber),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
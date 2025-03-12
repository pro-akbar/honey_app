import 'package:flutter/material.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50], // Light background
      appBar: AppBar(
        title: const Text('Inventory', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.amber[800], // Amber app bar
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: const Text('Batch 1', style: TextStyle(color: Color.fromARGB(255, 231, 139, 19))),
            subtitle: const Text('Status: Safe', style: TextStyle(color: Colors.green)), // Correct usage of subtitle
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                // Delete batch
              },
            ),
          ),
          ListTile(
            title: const Text('Batch 2', style: TextStyle(color: Color.fromARGB(255, 231, 139, 19))),
            subtitle: const Text('Status: Needs Attention', style: TextStyle(color: Colors.red)), // Correct usage of subtitle
            trailing: IconButton(
              icon: const Icon(Icons.edit, color: Colors.blue),
              onPressed: () {
                // Edit batch
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to add batch screen
        },
        backgroundColor: Colors.amber[800], // Amber FAB
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
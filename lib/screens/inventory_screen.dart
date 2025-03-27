import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'batch_details_screen.dart';
import 'add_batch_screen.dart';
import 'batch_model.dart';
import 'package:honey/widgets/bottom_navbar.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  _InventoryScreenState createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  int _selectedIndex = 1; // Set the index for Inventory

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        // Already on Inventory screen
        break;
      case 2:
        Navigator.pushNamed(context, '/laws');
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
      // Wrap the existing Scaffold in a new Scaffold
      body: Scaffold(
        appBar: AppBar(
          title: const Text('Inventory Management'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search batches",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('batches').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text('No batches found.'));
                  }

                  // Display the list of batches
                  return ListView(
                    children: snapshot.data!.docs.map((doc) {
                      final batch = Batch.fromMap(doc.id, doc.data() as Map<String, dynamic>);
                      return _buildBatchTile(context, batch);
                    }).toList(),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AddBatchScreen()),
                  );
                },
                child: const Text("Add New Batch"),
              ),
            ),
          ],
        ),
      ),
      // Add the BottomNavBar here
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  Widget _buildBatchTile(BuildContext context, Batch batch) {
    return ListTile(
      title: Text(batch.batchName),
      subtitle: Text("${batch.date}, Floral: ${batch.floralSource}"),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddBatchScreen(batch: batch),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              _deleteBatch(batch.id);
            },
          ),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BatchDetailsScreen(batch: batch),
          ),
        );
      },
    );
  }

  void _deleteBatch(String id) async {
    await _firestore.collection('batches').doc(id).delete();
  }
}
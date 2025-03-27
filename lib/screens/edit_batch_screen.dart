import 'package:flutter/material.dart';

class EditBatchScreen extends StatelessWidget {
  final String batchName;
  final String floralSource;
  final String date;
  final String quantity;

  const EditBatchScreen({
    super.key,
    required this.batchName,
    required this.floralSource,
    required this.date,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController batchNameController = TextEditingController(text: batchName);
    TextEditingController floralSourceController = TextEditingController(text: floralSource);
    TextEditingController dateController = TextEditingController(text: date);
    TextEditingController quantityController = TextEditingController(text: quantity);

    return Scaffold(
      appBar: AppBar(title: const Text("Edit Batch")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: batchNameController, decoration: const InputDecoration(labelText: "Batch Name")),
            TextField(controller: floralSourceController, decoration: const InputDecoration(labelText: "Floral Source")),
            TextField(controller: dateController, decoration: const InputDecoration(labelText: "Harvest Date")),
            TextField(controller: quantityController, decoration: const InputDecoration(labelText: "Quantity")),
            const SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Save"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text("Cancel"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'batch_model.dart'; // Import the Batch model

class AddBatchScreen extends StatefulWidget {
  final Batch? batch; // Add this to handle editing existing batches

  const AddBatchScreen({super.key, this.batch});

  @override
  AddBatchScreenState createState() => AddBatchScreenState();
}

class AddBatchScreenState extends State<AddBatchScreen> {
  final _formKey = GlobalKey<FormState>(); // Add a form key for validation
  final TextEditingController batchNameController = TextEditingController();
  final TextEditingController floralSourceController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();

    // If editing an existing batch, populate the fields with its data
    if (widget.batch != null) {
      batchNameController.text = widget.batch!.batchName;
      floralSourceController.text = widget.batch!.floralSource;
      dateController.text = widget.batch!.date;
      quantityController.text = widget.batch!.quantity;
    }
  }

  // Function to show the date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Default to today's date
      firstDate: DateTime(2000), // Earliest selectable date
      lastDate: DateTime(2100), // Latest selectable date
    );

    if (picked != null) {
      // Format the date as a string (e.g., "2023-10-15")
      final formattedDate = "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
      setState(() {
        dateController.text = formattedDate; // Update the date field
      });
    }
  }

  Future<void> saveBatch() async {
    if (_formKey.currentState!.validate()) {
      final batch = Batch(
        id: widget.batch?.id ?? '', // Use existing ID if editing
        batchName: batchNameController.text,
        floralSource: floralSourceController.text,
        date: dateController.text,
        quantity: quantityController.text,
      );

      if (widget.batch == null) {
        // Add new batch
        await _firestore.collection('batches').add(batch.toMap());
      } else {
        // Update existing batch
        await _firestore.collection('batches').doc(batch.id).update(batch.toMap());
      }

      // Go back to the Inventory Screen
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.batch == null ? "Add New Batch" : "Edit Batch"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Add the form key here
          child: Column(
            children: [
              TextFormField(
                controller: batchNameController,
                decoration: const InputDecoration(labelText: "Batch Name"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a batch name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: floralSourceController,
                decoration: const InputDecoration(labelText: "Floral Source"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a floral source';
                  }
                  return null;
                },
              ),
              // Harvest Date Field with Calendar Picker
              TextFormField(
                controller: dateController,
                decoration: InputDecoration(
                  labelText: "Harvest Date",
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context), // Open the date picker
                  ),
                ),
                readOnly: true, // Make the field read-only to prevent manual typing
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a harvest date';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: quantityController,
                decoration: const InputDecoration(labelText: "Quantity"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a quantity';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: saveBatch,
                child: const Text("Save Batch"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
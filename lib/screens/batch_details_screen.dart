import 'package:flutter/material.dart';
import 'package:honey/screens/batch_model.dart';

class BatchDetailsScreen extends StatelessWidget {
  final Batch batch;

  const BatchDetailsScreen({super.key, required this.batch});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(batch.batchName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Date: ${batch.date}'),
            Text('Floral Source: ${batch.floralSource}'),
            Text('Quantity: ${batch.quantity}'),
          ],
        ),
      ),
    );
  }
}
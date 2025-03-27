// batch_model.dart
class Batch {
  final String id;
  final String batchName;
  final String date;
  final String floralSource;
  final String quantity;

  Batch({
    required this.id,
    required this.batchName,
    required this.date,
    required this.floralSource,
    required this.quantity,
  });

  // Convert a Batch object to a Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'batchName': batchName,
      'date': date,
      'floralSource': floralSource,
      'quantity': quantity,
    };
  }

  // Create a Batch object from a Firestore document
  factory Batch.fromMap(String id, Map<String, dynamic> data) {
    return Batch(
      id: id,
      batchName: data['batchName'],
      date: data['date'],
      floralSource: data['floralSource'],
      quantity: data['quantity'],
    );
  }
}
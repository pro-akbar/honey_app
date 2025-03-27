// import 'package:flutter/material.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0; // Index of the selected bottom navigation item

//   // List of screens to navigate to
//   static const List<Widget> _widgetOptions = <Widget>[
//     HomeContent(), // Home screen content
//     InventoryScreen(), // Inventory screen
//     LawsGuidelinesScreen(), // Laws and Guidelines screen
//     QRScannerScreen(), // QR Scanner screen
//     WeatherStatusScreen(), // Weather Status screen
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home'),
//         automaticallyImplyLeading: false, // Remove back button
//       ),
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex), // Display the selected screen
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed, // Fixed type for more than 3 items
//         backgroundColor: Colors.amber[800], // Amber background color
//         selectedItemColor: Colors.white, // Selected item color
//         unselectedItemColor: Colors.white.withOpacity(0.6), // Unselected item color
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.inventory),
//             label: 'Inventory',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.gavel),
//             label: 'Laws',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.qr_code_scanner),
//             label: 'QR Scan',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.cloud),
//             label: 'Weather',
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Placeholder for Home Content
// class HomeContent extends StatelessWidget {
//   const HomeContent({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Text(
//         'Welcome to the Home Screen!',
//         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//       ),
//     );
//   }
// }

// // Placeholder for Inventory Screen
// class InventoryScreen extends StatelessWidget {
//   const InventoryScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Text(
//         'Inventory Screen',
//         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//       ),
//     );
//   }
// }

// // Placeholder for Laws and Guidelines Screen
// class LawsGuidelinesScreen extends StatelessWidget {
//   const LawsGuidelinesScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Text(
//         'Laws and Guidelines Screen',
//         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//       ),
//     );
//   }
// }

// // Placeholder for QR Scanner Screen
// class QRScannerScreen extends StatelessWidget {
//   const QRScannerScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Text(
//         'QR Scanner Screen',
//         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//       ),
//     );
//   }
// }

// // Placeholder for Weather Status Screen
// class WeatherStatusScreen extends StatelessWidget {
//   const WeatherStatusScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Text(
//         'Weather Status Screen',
//         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BeekeeperDashboard extends StatefulWidget {
  const BeekeeperDashboard({super.key});

  @override
  _BeekeeperDashboardState createState() => _BeekeeperDashboardState();
}

class _BeekeeperDashboardState extends State<BeekeeperDashboard> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beekeeper Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await _auth.signOut();
              if (mounted) {
                Navigator.pushReplacementNamed(context, '/login');
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/inventory');
              },
              child: const Text('View Inventory'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/qr');
              },
              child: const Text('Scan QR Code'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to weather alerts screen
              },
              child: const Text('Weather Alerts'),
            ),
          ],
        ),
      ),
    );
  }
}
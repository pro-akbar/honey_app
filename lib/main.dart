import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Firebase configuration file
import 'screens/splash_screen.dart'; // Splash screen
import 'screens/login_screen.dart'; // Login screen
import 'screens/registration_screen.dart'; // Registration screen
import 'screens/home_screen.dart'; // Home screen
import 'screens/admin_dashboard.dart'; // Admin dashboard
import 'screens/beekeeper_dashboard.dart'; // Beekeeper dashboard
import 'screens/inventory_screen.dart'; // Inventory screen
import 'screens/qr_code_scanner.dart'; // QR Scanner screen
import 'screens/laws_guidelines_screen.dart'; // Laws and Guidelines screen

void main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Run the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Honey App',
      theme: ThemeData(
        primarySwatch: Colors.amber, // Amber as the primary color
        scaffoldBackgroundColor: Colors.amber[50], // Light amber background
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.amber[800], // Dark amber app bar
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber[800], // Amber buttons
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.amber[800], // Amber text for text buttons
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegistrationScreen(),
        '/home': (context) => const HomeScreen(),
        '/admin': (context) => const AdminDashboard(),
        '/beekeeper': (context) => const BeekeeperDashboard(),
        '/inventory': (context) => const InventoryScreen(),
        '/qrscanner': (context) => const QRScannerScreen(),
        '/laws': (context) => const LawsGuidelinesScreen(),
      },
    );
  }
}
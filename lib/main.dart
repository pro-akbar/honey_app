import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'screens/admin_dashboard.dart';
import 'screens/beekeeper_dashboard.dart';
import 'screens/add_batch_screen.dart';
import 'screens/edit_batch_screen.dart';
import 'screens/batch_details_screen.dart';
import 'screens/splash_screen.dart';

import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/home_screen.dart';
import 'screens/inventory_screen.dart';
import 'screens/laws_guidelines_screen.dart';
import 'screens/qr_code_scanner.dart';
import 'screens/weather_status_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Honey App',
      debugShowCheckedModeBanner: false, // Remove debug banner
      theme: ThemeData(
        // Primary and secondary colors inspired by honey and bees
        primaryColor: const Color(0xFFFFC107), // Bright honey yellow
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.amber,
          accentColor: const Color(0xFFFFA000), // Darker amber for accents
        ),

        // Scaffold background color (light and warm)
        scaffoldBackgroundColor: const Color(0xFFFFF3E0), // Light honeycomb

        // AppBar theme
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFFFFC107), // Bright honey yellow
          elevation: 4, // Shadow under the app bar
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Lobster', // Custom font for a playful feel
          ),
          iconTheme: const IconThemeData(
            color: Colors.white, // App bar icons color
          ),
        ),

        // Text theme
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF4E342E)), // Dark brown for headings
          displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF4E342E)),
          displaySmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF4E342E)),
          bodyLarge: TextStyle(fontSize: 18, color: Color(0xFF4E342E)), // Dark brown for body text
          bodyMedium: TextStyle(fontSize: 16, color: Color(0xFF4E342E)),
          bodySmall: TextStyle(fontSize: 14, color: Color(0xFF6D4C41)), // Lighter brown for small text
        ),

        // Button theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFFA000), // Darker amber for buttons
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lobster', // Custom font for buttons
            ),
          ),
        ),

        // Input decoration theme (for TextFields)
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          hintStyle: TextStyle(color: Colors.grey[600]),
        ),

        // Card theme
        cardTheme: CardTheme(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.all(8),
          color: Colors.white, // White cards with golden accents
        ),

        // Icon theme
        iconTheme: const IconThemeData(
          color: Color(0xFFFFC107), // Bright honey yellow for icons
        ),

        // Custom font for the entire app
        fontFamily: 'Raleway', // A modern, elegant font
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const RegistrationScreen(),
        '/home': (context) => const HomeScreen(),
        '/inventory': (context) => const InventoryScreen(),
        '/laws': (context) => const LawsGuidelinesScreen(),
        '/qrscanner': (context) => const QRScannerScreen(),
        '/weather': (context) => const WeatherStatusScreen(),
      },
    );
  }
}
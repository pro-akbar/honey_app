import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // For JSON decoding
import 'package:honey/widgets/bottom_navbar.dart';

class WeatherStatusScreen extends StatefulWidget {
  const WeatherStatusScreen({super.key});

  @override
  _WeatherStatusScreenState createState() => _WeatherStatusScreenState();
}

class _WeatherStatusScreenState extends State<WeatherStatusScreen> {
  final String apiKey = '13b2cf8bd488d4ba737c5de82b07ed95'; // Your OpenWeatherMap API key
  final String city = 'Muscat'; // Replace with a valid city name
  Map<String, dynamic>? weatherData;
  bool isLoading = true;
  String errorMessage = '';
  int _selectedIndex = 4; // Set the index for Weather

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/inventory');
        break;
      case 2:
        Navigator.pushNamed(context, '/laws');
        break;
      case 3:
        Navigator.pushNamed(context, '/qrscanner');
        break;
      case 4:
        // Already on Weather screen
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeatherData();
  }

  Future<void> _fetchWeatherData() async {
    final String apiUrl =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      print('API URL: $apiUrl'); // Debug: Print the API URL
      print('Response Status Code: ${response.statusCode}'); // Debug: Print the status code
      print('Response Body: ${response.body}'); // Debug: Print the response body

      if (response.statusCode == 200) {
        setState(() {
          weatherData = json.decode(response.body);
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'Failed to load weather data. Status Code: ${response.statusCode}';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'An error occurred: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Status'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text(errorMessage))
              : weatherData != null
                  ? _buildWeatherInfo()
                  : const Center(child: Text('No weather data available.')),
      // Add the BottomNavBar here
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  Widget _buildWeatherInfo() {
    final String cityName = weatherData!['name'];
    final double temperature = weatherData!['main']['temp'];
    final String weatherDescription = weatherData!['weather'][0]['description'];
    final String iconCode = weatherData!['weather'][0]['icon'];

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            cityName,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Image.network(
            'https://openweathermap.org/img/wn/$iconCode@2x.png',
            width: 100,
            height: 100,
          ),
          const SizedBox(height: 10),
          Text(
            '${temperature.toStringAsFixed(1)}°C',
            style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            weatherDescription,
            style: const TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
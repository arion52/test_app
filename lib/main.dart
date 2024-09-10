import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';

// Define constants for configuration
const String apiUrl =
    'http://172.16.45.24:8000'; // Replace with your computer's IP

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solar Panel Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LoginScreen(), // Initial screen
      routes: {
        '/home': (context) => HomeScreen(
            token: ModalRoute.of(context)!.settings.arguments as String),
        // Add other routes if needed
      },
    );
  }
}

// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  final String token;
  const HomeScreen({super.key, required this.token});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Method to fetch data
  Future<void> getData() async {
    final response = await http.get(
      Uri.parse('http://127.0.0.1:8000/api/predict_view/'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${widget.token}',
      },
    );

    if (response.statusCode == 200) {
      // Process response
      final data = jsonDecode(response.body);
      print('Data received: $data');
    } else {
      // Handle error
      print('Failed to fetch data');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Call getData() where appropriate, such as in initState() or a button press
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: getData, // Call getData when button is pressed
          child: const Text('Fetch Data'),
        ),
      ),
    );
  }
}

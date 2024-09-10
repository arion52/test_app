import 'dart:convert';
import 'package:http/http.dart' as http;

const String apiUrl = 'http://172.16.45.24:8000';

Future<Map<String, dynamic>?> login(String username, String password) async {
  // Debugging: print the username and password being sent
  print('Attempting login with username: $username, password: $password');

  final response = await http.post(
    Uri.parse('$apiUrl/api/token/'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'username': username,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return {
      'access': data['access'],
      'refresh': data['refresh'],
    };
  } else if (response.statusCode == 401) {
    print('Login failed: Invalid username or password');
    return null;
  } else {
    print(
        'Login failed with status: ${response.statusCode}, body: ${response.body}');
    return null;
  }
}

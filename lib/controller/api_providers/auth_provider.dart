import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:test_provider/view/home.dart'; // Adjust the import path according to your project structure

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void login(BuildContext context, String email, String password) async {
    setLoading(true);
    try {
      final response = await http.post(
        Uri.parse('https://api.acad360.com/v1.1/attendees/login'),
        headers: {
          'tenantid': '63c827a94f51b07114e9d992',
          'username': 'events-app',
          'key': 'cff4c505-9718-4091-a949-060e122ea560',
          'secret': '57ed9e57-d40d-454c-9a11-7764693e2f7e-d08c347ea0134c9a1ce0f24196c1624b',
          'Content-Type': 'application/json'
        },
        body: jsonEncode({
          'email': email,
          'password': password,
          "eventId": "6376226145148df47313a86c"
        }),
      );

      if (response.statusCode == 200) {
        print('Login Successful');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      } else {
        print('Failed: ${response.statusCode} ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setLoading(false);
    }
  }
}

import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:salty_test/services/api.dart';
import 'package:salty_test/widget/bottom_nav.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthBloc {
  final _tokenController = StreamController<String?>.broadcast();
  Stream<String?> get tokenStream => _tokenController.stream;

  Future<void> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        body: {'email': email, 'password': password},
      );
      final Map<String, dynamic> data = json.decode(response.body);
      if (response.statusCode == 200) {
        final String token = data['token'];
        // Store the token locally using SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', token);
        _tokenController.add(token);
        Get.snackbar('Success', 'Welcome');
        Get.offAll(() => const BottomNav());

      } else {
        String errormsg = data['error'];
        Get.snackbar('Error', errormsg);
        throw Exception('Login failed');
      }
    } catch (error) {
      throw Exception('Login failed: $error');
    }
  }

  Future<String?> getStoredToken() async {
    // Retrieve the stored token from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> logout() async {
   try {
     // Delete the stored token from SharedPreferences
     SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.remove('token');
      _tokenController.add(null);
   }catch (error) {
     throw Exception('Logout failed: $error');
   }
  }

  Future<bool> isUserLoggedIn() async {
    // Check if the user is already logged in
    String? token = await getStoredToken();
    return token != null;
  }

  void dispose() {
    _tokenController.close();
  }
}

final authBloc = AuthBloc();

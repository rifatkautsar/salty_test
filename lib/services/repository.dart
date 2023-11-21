import 'dart:convert';

import 'package:salty_test/data/model/users_model.dart';
import 'package:http/http.dart' as http;
import 'package:salty_test/services/api.dart';

class Service {
  Future<List<UserData>> fetchDataUsers(int page) async{
    try {
      final response = await http.get(Uri.parse('$baseUrl/users?page=$page'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['data'];
        final List<UserData> userList = data.map((item) => UserData.fromJson(item)).toList();
        return userList;
      } else {
        throw Exception('Failed Load Data');
      }
    } catch (error) {
      throw Exception('error');
    }
  }
}
import 'dart:convert';
import 'package:hostel_management/models/role.dart';
import 'package:http/http.dart' as http;

Future<int?> fetchUserRole(String emailId) async {
  final response = await http.post(
    Uri.parse('https://hostelmanagment-i86p.onrender.com/user/getRole'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      'emailId': emailId,
    }),
  );

  if (response.statusCode == 200) {
    final responseBody = json.decode(response.body);
    if (responseBody['status'] == 'SUCCESS') {
      return UserRole.fromJson(responseBody).roleId;
    } else {
      print('Failed to load user role');
    }
  } else {
    throw Exception('Failed to load user role');
  }
}

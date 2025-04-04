import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String _baseUrl = 'https://carros-electricos.wiremockapi.cloud';

  Future<String?> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/auth'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['token']; // Guardar el token
    }
    return null;
  }

  Future<List<dynamic>?> fetchCars(String token) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/carros'),
      headers: {'Authentication': token},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return null;
  }
}

import 'package:dio/dio.dart';

class LoginService {
  final Dio _dio = Dio();

  Future<String?> login(String email, String password) async {
    try {
      final response = await _dio.post(
        'http://localhost:3333/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final token = response.data['token']['token'];
        return token;
      } else {
        return null;
      }
    } catch (e) {
      print('Error during login: $e');
      return null;
    }
  }
}

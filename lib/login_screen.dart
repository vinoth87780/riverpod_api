import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void login(BuildContext context, String email, String password) async {
    String apiUrl = 'http://912.168.1.36:3333/login';

    try {
      Response response = await post(
        Uri.parse(apiUrl),
        body: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 201) {
        print('Login successful');
        // Navigate to the homepage or do something else
      } else {
        print('Login failed');
        // Show an error message or handle the error
      }
    } catch (e) {
      print('Error: ${e.toString()}');
      // Show a dialog or a snackbar with the error message
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                login(context, _emailController.text.trim(),
                    _passwordController.text.trim());
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  @observable
  bool isLoading = false;

  @observable
  String error = '';

  @observable
  String? username;

  @observable
  String? token;

  @action
  Future<void> login(String email, String password) async {
    isLoading = true;
    error = '';

    try {
      final response = await http.post(
        Uri.parse('https://api.escuelajs.co/api/v1/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': email, 'password': password}),
      );

      if (response.statusCode == 201) {
        final jsonData = json.decode(response.body);
        token = jsonData['access_token'];
        print(token);
        print("login sucussfull");
      } else {
        error = 'Login failed: ${response.body}';
      }
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
    }
  }
}

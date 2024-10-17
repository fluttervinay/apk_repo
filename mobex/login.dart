import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tmp/mobex/login_store.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final AuthStore authStore = AuthStore();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Observer(
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: emailController, // Use the controller
                  decoration: InputDecoration(
                    hintText: "Enter Email",
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: passwordController, // Use the controller
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                  ),
                  obscureText: true, // Add this for password security
                ),
                SizedBox(height: 20),

                if (authStore.isLoading)
                  CircularProgressIndicator()
                else
                  ElevatedButton(
                    onPressed: () {
                      authStore.login(
                          emailController.text, // Use the controller text
                          passwordController.text // Use the controller text
                      );
                    },
                    child: Text('Login'),
                  ),
                if (authStore.error.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(authStore.error, style: TextStyle(color: Colors.red)), // Display actual error message
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: constraints.maxWidth * 0.1,
              vertical: constraints.maxHeight * 0.1,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.webp',
                  width: constraints.maxWidth * 0.3,
                  height: constraints.maxHeight * 0.2,
                ),
                SizedBox(height: constraints.maxHeight * 0.05),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: constraints.maxHeight * 0.05),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: constraints.maxHeight * 0.1),
                ElevatedButton(
                  onPressed: () {
                    // Login logic here
                  },
                  child: Text('Login'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
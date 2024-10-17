import 'package:flutter/material.dart';
import 'package:tmp/mobex/api_services.dart';

class UpdateUser extends StatefulWidget {
  const UpdateUser({super.key});

  @override
  State<UpdateUser> createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
  final _nameController = TextEditingController();
  String _userName = ''; // Initialize an empty string to store the updated user name

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Enter user name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10,),
            Text('Updated Name: $_userName') // Display the updated user name
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Apiservices().updateUser(7, _nameController.text).then((value) {
            setState(() {
              _userName = _nameController.text; // Update the user name
              _nameController.clear(); // Clear the TextField
            });
          });
        },
        child: Icon(Icons.update),
      ),
    );
  }
}
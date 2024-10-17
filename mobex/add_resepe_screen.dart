import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tmp/mobex/add_resepe_store.dart';

class AddResepeScreen extends StatefulWidget {
  const AddResepeScreen({super.key});

  @override
  State<AddResepeScreen> createState() => _AddResepeScreenState();
}

class _AddResepeScreenState extends State<AddResepeScreen> {
  TextEditingController bodyController = TextEditingController();
  TextEditingController postController = TextEditingController();
  TextEditingController userController = TextEditingController();

  AddResepeStore addResepeStore = AddResepeStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Resepe'),
      ),
      body: Observer(
        builder: (_) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: bodyController,
                  decoration: const InputDecoration(
                    hintText: "Enter Body",
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: postController,
                  keyboardType: TextInputType.number, // Ensure input is numeric
                  decoration: const InputDecoration(
                    hintText: "Post ID",
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: userController,
                  keyboardType: TextInputType.number, // Ensure input is numeric
                  decoration: const InputDecoration(
                    hintText: "User ID",
                  ),
                ),
                const SizedBox(height: 20),
                if (addResepeStore.isLoading)
                  const Center(child: CircularProgressIndicator())
                else
                  ElevatedButton(
                      onPressed: () {
                        // Safely convert String to int using int.tryParse()
                        final int? postId = int.tryParse(postController.text);
                        final int? userId = int.tryParse(userController.text);

                        if (postId != null && userId != null) {
                          addResepeStore.addResepeApi(
                              bodyController.text,
                              postId,
                              userId,
                              context,
                          );
                        } else {
                          // Show an error message if conversion fails
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Please enter valid Post ID and User ID"))
                          );
                        }
                      },
                      child: const Text('Submit')
                  ),

                SizedBox(height: 30,),

                const SizedBox(height: 20),

                // Observer to display response data
                Observer(
                  builder: (_) {
                    if (addResepeStore.responseData != null) {
                      final response = addResepeStore.responseData!;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('ID: ${response['id']}'),
                          Text('Body: ${response['body']}'),
                          Text('Post ID: ${response['postId']}'),
                          Text('User ID: ${response['user']['id']}'),
                          Text('Username: ${response['user']['username']}'),
                          Text('Full Name: ${response['user']['fullName']}'),
                        ],
                      );
                    } else if (addResepeStore.error.isNotEmpty) {
                      return Text(
                        'Error: ${addResepeStore.error}',
                        style: const TextStyle(color: Colors.red),
                      );
                    }
                    return const SizedBox(); // Return empty space if no data
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

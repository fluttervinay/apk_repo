import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tmp/mobex/delete_store.dart';

class DeleteScreen extends StatefulWidget {
  const DeleteScreen({super.key});

  @override
  State<DeleteScreen> createState() => _DeleteScreenState();
}

class _DeleteScreenState extends State<DeleteScreen> {
  TextEditingController deletecontroller=TextEditingController();
  final DeleteStore deleteStore=DeleteStore();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Screen'),
      ),
      body: Observer(
          builder: (_) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    controller: deletecontroller,
                    decoration: InputDecoration(
                        hintText: "Enter Value"
                    ),
                  ),
                  SizedBox(height: 30,),
                  if(deleteStore.isloading)
                    CircularProgressIndicator()
                  else
                    ElevatedButton(onPressed: () {
                      deleteStore.deleteApi(
                        context,
                        deletecontroller.text,
                      );
                    }, child: Text('Delete')),
                  if(deleteStore.Error.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(deleteStore.Error, style: TextStyle(color: Colors.red)), // Display actual error message
                      ),
                    ),
                ],
              ),
            );
          },
      )
    );
  }
}

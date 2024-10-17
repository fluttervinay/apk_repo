import 'package:flutter/material.dart';
import 'package:tmp/mobex/api_services.dart';

class Delete extends StatefulWidget {
  const Delete({super.key});

  @override
  State<Delete> createState() => _DeleteState();
}

class _DeleteState extends State<Delete> {
  TextEditingController delete=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete'),
      ),
      body: Column(
        children: [
          TextField(
            controller: delete,
            decoration: InputDecoration(
              hintText: 'eneter id'
            ),
          ),
          SizedBox(height: 30,),
          ElevatedButton(onPressed: () {
            Apiservices().deleteapi(delete.text).then((value) {
              print('delete${value}');
            },).onError((error, stackTrace) {
              print('Error=>${error.toString()}');
            },);
          }, child: Text('Delete'))
        ],
      ),
    );
  }
}

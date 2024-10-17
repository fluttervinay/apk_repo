import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
part 'delete_store.g.dart';

class DeleteStore = _Deletestore with _$DeleteStore;

abstract class _Deletestore with Store{
  @observable
  bool isloading=false;

  @observable
  String Error="";

  Future<dynamic> deleteApi(BuildContext context, String id) async {
    isloading = true;
    Error = '';

    try {
      var response = await http.delete(Uri.parse('https://api.escuelajs.co/api/v1/products/$id'));
      print(response.body);

      if (response.statusCode == 200) {
        print("Value Delete successful: $id");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text('Value Delete successful $id $response'),
          ),
        );
        return jsonDecode(response.body);
      } else {
        print("Failed to delete value: $id");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to delete value $id'),
          ),
        );
        return [];
      }
    } catch (error) {
      print("Error==> ${error.toString()}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to delete value $id'),
        ),
      );
      return [];
    } finally {
      isloading = false;
    }
  }
}
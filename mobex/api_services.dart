import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tmp/provider/job_provider.dart';
import 'package:tmp/provider/user_modal.dart';

import '../get_x/modal/productmodal.dart';
import '../provider/job_modal.dart';

class Apiservices{

  Future<List<dynamic>> getdata() async {
    try {
      var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      print(response.body);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return []; // Return an empty list
      }
    } catch (error) {
      print("Error==>${error.toString()}");
      return [];
    }
  }

  Future<List<ProductModal>?> getAllproductcategory() async {
    try {
      var response = await http.get(Uri.parse('https://api.escuelajs.co/api/v1/categories'));
      print(response.body);
      if (response.statusCode == 200) {
        return List<ProductModal>.from(json.decode(response.body).map((x) => ProductModal.fromJson(x)));
      }
    } catch (e) {
      print("Error:${e.toString()}");
      return [];
    }
  }

  Future <dynamic> deleteapi(String id) async {
    try {
      var response = await http.delete(Uri.parse('https://api.escuelajs.co/api/v1/products/$id'));
      print(response.body);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return [];
      }
    } catch (error) {
      print("Error==>${error.toString()}");
      return [];
    }
  }

  Future<UserModal> userapi()async{
    late UserModal userModal;
    final response=await http.get(Uri.parse('https://dummyjson.com/users'));
    print(response.body);

    if(response.statusCode==200){
      userModal=UserModal.fromJson(json.decode(response.body));
    }else{
      print("Error");
    }
    return userModal;
  }
  Future<List<JobModal>?> jobapi() async {
    try {
      var response = await http.get(Uri.parse('https://the-rosary-api.vercel.app/v1/monday'));

      if (response.statusCode == 200) {
        var decodedData = json.decode(response.body);
        String prettyJson = JsonEncoder.withIndent('  ').convert(decodedData);
        debugPrint("API RESPONSE==>$prettyJson", wrapWidth: 1024);

        return List<JobModal>.from(decodedData.map((x) => JobModal.fromJson(x)));
      }
    } catch (e) {
      print("Error: ${e.toString()}");
      return [];
    }
  }

  Future<void> updateUser(int userId, String newName) async {
    final url = 'https://fakestoreapi.com/users/$userId';
    final headers = {
      'Content-Type': 'application/json',
    };
    final body = jsonEncode({
      'name': newName,
    });

    final response = await http.put(Uri.parse(url), headers: headers, body: body);
    print("API RESPONSE==>${response.body}");
    if (response.statusCode == 200) {
      // Handle the response
      final jsonData = jsonDecode(response.body);
      print('Updated user name: ${jsonData['name']}');
    } else {
      print('Error updating user: ${response.statusCode}');
    }
  }

  Future<dynamic>gettewline()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    print(response.body);
    final data = jsonDecode(response.body);
    return data;
  }

  Future<dynamic> getProductsByTitle(BuildContext context, String title) async {
    var url = Uri.parse('https://api.escuelajs.co/api/v1/products/?price=$title');

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        final prettyJson = JsonEncoder.withIndent('  ').convert(jsonData);
        debugPrint('json api response:\n$prettyJson', wrapWidth: 1024);
        return jsonData;
      } else {
       print('Failed to fetch products');
        return [];
      }
    } catch (error) {
      print("Error==> ${error.toString()}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to fetch products'),
        ),
      );
      return [];
    }
  }

}
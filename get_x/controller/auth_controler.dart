
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController{
  var isloading=false.obs;
  dynamic loginresponse;

  getdata(String email,String password,BuildContext context)async{
    isloading(true);
    try{
      var response= await http.post(Uri.parse('https://dummyjson.com/auth/login'),
          body: {
            "username": email,
            "password": password,
          }
      );
      if(response.statusCode==200){
        loginresponse= jsonDecode(response.body);
        print('API RESPONSE:${loginresponse}');
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', loginresponse['token']);
        print('Token===>: ${loginresponse['token']}');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text('Login Succesfull.'),
          ),
        );
        // Get.to(()=>AuthHome());
      }
      isloading(false);
    }catch(e){
      print("Error:${e.toString()}");
    }
  }
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> fetchUserData() async {
    final token = await getToken();
    if (token != null) {
      try {
        var response = await http.get(Uri.parse('https://dummyjson.com/auth/login'),
            headers: {
              'Authorization': 'Bearer $token',
            }
        );
        if (response.statusCode == 200) {
          var userData = jsonDecode(response.body);
          print('User Data: $userData');
        } else {
          print('Error: ${response.statusCode}');
        }
      } catch (e) {
        print('Error: ${e.toString()}');
      }
    } else {
      print('Token is null');
    }
  }
}


//flutter secure storage

// Function to get token from local storage
// final storage = FlutterSecureStorage();

// if (response.statusCode == 200) {
// loginresponse = jsonDecode(response.body);
// print('API RESPONSE:${loginresponse}');
//
// // Save token to local storage
// await storage.write(key: 'token', value: loginresponse['token']);
//
// ScaffoldMessenger.of(context).showSnackBar(
// const SnackBar(
// backgroundColor: Colors.green,
// content: Text('Login Succesfull.'),
// ),
// );
// }
// Future<String?> getToken() async {
//   return await storage.read(key: 'token');
// }
//
// // Function to remove token from local storage
// Future<void> removeToken() async {
//   await storage.delete(key: 'token');
// }
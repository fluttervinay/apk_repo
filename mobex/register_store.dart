import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
part 'register_store.g.dart';

class RegisterStore = _register with _$RegisterStore;

abstract class _register with Store{
  @observable
  bool isloading=false;

  @observable
  String Error='';

  @observable
  String? token;

  Future<void>registretion(BuildContext context ,String username,String password)async{
    isloading=true;
    Error='';
    try{
      final rrsponse=await http.post(Uri.parse("https://dummyjson.com/auth/login"),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({"username":username, "password":password,})
      );
      // print(rrsponse.body);
      if(rrsponse.statusCode==200){
        final jsondata=json.decode(rrsponse.body);
        token=jsondata['accessToken'];
        // print("ACCESS TOCKEN: ${token}");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login successful!'),
          ),
        );
        // API RESPONSE, pretty-print the JSON response
        final prettyJson = JsonEncoder.withIndent('  ').convert(jsondata);
        debugPrint('json api response:\n$prettyJson',wrapWidth: 1024);

        print("REGISTER SUCCESFULL");
      }
    }catch(e){
      print("Error==>${e.toString()}");
    }finally{
      isloading=false;
    }
  }
}
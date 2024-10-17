import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/auth_controler.dart';

class AuthLogin extends StatefulWidget {
  const AuthLogin({super.key});

  @override
  State<AuthLogin> createState() => _AuthLoginState();
}

class _AuthLoginState extends State<AuthLogin> {
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();

  AuthController authController= Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white,),
        title: Text('Auth Login',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: email,
                decoration: InputDecoration(
                  hintText: 'Enter Email',
                ),
              ),
              TextField(
                controller: password,
                decoration: InputDecoration(
                  hintText: 'Enter password',
                ),
              ),
              SizedBox(height: 10,),
              SizedBox(
                  height: 50,
                  width: 300,
                  child:Obx(()=> ElevatedButton(onPressed: () {
                    authController.getdata(
                      email.text,
                      password.text,
                      context,
                    );
                  }, child: authController.isloading.value?Center(child: CircularProgressIndicator(color: Colors.white,),):
                  Text('Login',style: TextStyle(color: Colors.white,fontSize: 16),)),)
              )
            ],
          ),
        ),
      ),
    );
  }
}
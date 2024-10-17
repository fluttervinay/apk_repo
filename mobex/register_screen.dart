import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tmp/mobex/register_store.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController usernamecontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();

  final RegisterStore registerStore=RegisterStore();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Mobx'),
      ),
      body: Observer(
          builder: (_) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: usernamecontroller,
                    decoration: InputDecoration(
                        hintText: "Enter Username"
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    controller: passwordcontroller,
                    decoration: InputDecoration(
                        hintText: "Enter Password"
                    ),
                  ),
                  SizedBox(height: 30,),
                  if(registerStore.isloading)
                    Center(child: CircularProgressIndicator(),)
                  else
                    ElevatedButton(onPressed: () {
                      registerStore.registretion(
                          context,
                          usernamecontroller.text,
                          passwordcontroller.text
                      );
                    }, child: Text('Register')),
                  if(registerStore.Error.isNotEmpty)
                    Center(child: Text("Opps somthing want to wrong...!"),)
                ],
              ),
            );
          },
      )
    );
  }
}

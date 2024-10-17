import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmp/mobex/user_store.dart';

class UserUi extends StatefulWidget {
  const UserUi({super.key});

  @override
  State<UserUi> createState() => _UserUiState();
}

class _UserUiState extends State<UserUi> {
  final UserStore userStore = UserStore();

  @override
  void initState() {
    userStore.fetchUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MobX User'),
      ),
      body: Column(
        children: [
          Observer(
            builder: (_) {
              if (userStore.isloading) { // Corrected variable name
                return Center(child: CircularProgressIndicator());
              }
              if (userStore.error.isNotEmpty) {
                return Center(child: Text('Oops! Something went wrong.')); // Improved error message
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: userStore.users.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Text(userStore.users[index].id.toString()),
                      ),
                      title: Text(userStore.users?[index].name??""),
                      subtitle:  Container(
                        height: 300,
                        width: 400,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                            boxShadow: const[
                              BoxShadow(
                                  blurStyle: BlurStyle.normal,
                                  blurRadius: 20,
                                  spreadRadius: 0.1,
                                  offset: Offset(5, 10),
                                  color: Colors.black12
                              )
                            ]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(userStore.users[index].username??""),
                              Text(userStore.users[index].email??""),
                              Text(userStore.users[index].address?.street??""),
                              Text(userStore.users[index].address?.suite??""),
                              Text(userStore.users[index].address?.city??""),
                              Text(userStore.users[index].address?.zipcode??""),
                              Text(userStore.users[index].address?.geo?.lat??""),
                              Text(userStore.users[index].address?.geo?.lng??""),
                              Text(userStore.users[index].phone??""),
                              Text(userStore.users[index].website??""),
                              Text(userStore.users[index].company?.name??""),
                              Text(userStore.users[index].company?.catchPhrase??""),
                              Text(userStore.users[index].company?.bs??"")
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

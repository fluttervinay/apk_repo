import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmp/provider/user_provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
      Provider.of<UserProvider>(context,listen: false).getuser();
    },);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Screen'),
      ),
      body: Provider.of<UserProvider>(context).isloading?
          Center(child: CircularProgressIndicator(),):
          ListView.builder(
            itemCount: Provider.of<UserProvider>(context).userModal.users?.length,
            itemBuilder: (context, index) {
                final data=Provider.of<UserProvider>(context).userModal.users;
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(data![index].image.toString()),
                  ),
                  title: Text(data?[index].company?.address?.city??''),
                  subtitle: Column(
                    children: [
                      Text('Email:${data[index].email??""}'),
                      Text('Gender:${data[index].gender??""}'),
                      Text('Number:${data[index].phone??""}'),
                      Text('Currency:${data[index].bank?.currency??""}'),
                      Text('C_address:${data[index].company?.address?.address??""}')
                    ],
                  ),
                );
          },)
    );
  }
}

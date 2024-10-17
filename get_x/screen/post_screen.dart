import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart';
import 'package:tmp/get_x/controller/post_controller.dart';


class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  
  PostController postController=Get.put(PostController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get-x'),
      ),
      body: Obx(() => postController.isloading.value?const Center(child: CircularProgressIndicator(),):
      ListView.builder(
        itemCount: postController.data.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(postController.data[index]['title']),
            subtitle: Text(postController.data[index]['body']),
          );
        },),
      ),
    );
  }
}

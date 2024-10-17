
import 'package:get/get.dart';
import 'package:tmp/mobex/api_services.dart';

class PostController extends GetxController {

  var isloading=false.obs;
  var data;

  Future<void>onInit()async{
    getpost();
  }


  getpost(){
    isloading(true);
    Apiservices().getdata().then((value) {
      data=value;
      isloading(false);
    },).onError((error, stackTrace) {
      print("Error:${error.toString()}");
    },);
  }

}
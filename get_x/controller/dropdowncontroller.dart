

import 'package:get/get.dart';
import 'package:tmp/get_x/modal/productmodal.dart';
import 'package:tmp/mobex/api_services.dart';

class Dropdowncontroller extends GetxController{
  var isloading=false.obs;
  List<ProductModal> productModal=[];

  getproduct(){
    isloading(true);
    Apiservices().getAllproductcategory().then((value) {
      productModal=value!;
      isloading(false);
    },).onError((error, stackTrace) {
      print('Error=>${error.toString()}');
    },);
  }
}
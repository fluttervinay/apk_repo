
import 'package:flutter/cupertino.dart';
import 'package:tmp/mobex/api_services.dart';
import 'package:tmp/provider/user_modal.dart';

class UserProvider with ChangeNotifier{
  bool isloading=false;
  UserModal userModal = UserModal();

  getuser(){
    isloading=true;
    notifyListeners();
    Apiservices().userapi().then((value) {
      userModal=value;
      isloading=false;
      notifyListeners();
    },).onError((error, stackTrace) {
      print("Error:${error.toString()}");
    },);
  }
}
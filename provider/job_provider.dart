

import 'package:flutter/widgets.dart';
import 'package:tmp/mobex/api_services.dart';
import 'package:tmp/provider/job_modal.dart';

class JobProvider with ChangeNotifier{
  bool isloading=false;
  List<JobModal> jobModal=[];

  getjobdata(){
    isloading=true;
    Apiservices().jobapi().then((value) {
      jobModal=value!;
      isloading=false;

      notifyListeners();
    },).onError((error, stackTrace) {
      print('Error==>${error.toString()}');
    },);
  }
}

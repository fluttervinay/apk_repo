import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  void initState() {
    // TODO: implement initState
    print('Accual Device Height:${1.sh}');
    print('Accual Device width:${1.sw}');
    print('Width Scal Fector :${10.w}');
    print('height Scal Fector :${10.h}');
    print('Width  :${10.w}');
    print('height :${10.h}');
    print('Radious :${10.r}');
    print('Font Size :${15.sp}');
    print('Design Guide :${1.dg}');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' My Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0).w,
        child: Column(
          children: [
            CircleAvatar(
              radius: 50.r,
              backgroundImage: AssetImage('assets/logo.webp')
            ),
            SizedBox(height: 20.h),
            Text(
              'John Doe',
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.h),
            Text(
              'Software Engineer',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20.h),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet nulla auctor, vestibulum magna sed, convallis ex.',
              style: TextStyle(fontSize: 16.sp),
            ),
          ],
        ),
      ),
    );
  }
}
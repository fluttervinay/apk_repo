import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenUtiles extends StatefulWidget {
  const ScreenUtiles({super.key});

  @override
  State<ScreenUtiles> createState() => _ScreenUtilesState();
}

class _ScreenUtilesState extends State<ScreenUtiles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen Utiles'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {
              print('Accual Device Height:${1.sh}');
              print('Accual Device width:${1.sw}');
              print('Width Scal Fector :${10.w}');
              print('height Scal Fector :${10.h}');
              print('Width  :${10.w}');
              print('height :${10.h}');
              print('Radious :${10.r}');
              print('Font Size :${15.sp}');
              print('Design Guide :${1.dg}');
            }, child: Text('Chek size'))
          ],
        ),
      ),
    );
  }
}

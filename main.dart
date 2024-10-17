import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tmp/animation/animated_list.dart';
import 'package:tmp/animation/hero/screen1.dart';
import 'package:tmp/animation/lotte_animation/lotte_screen.dart';
import 'package:tmp/animation/ticker_animation.dart';
import 'package:tmp/local_auth/finger_auth.dart';
import 'package:tmp/localization/language.dart';
import 'package:tmp/localization/mail_screeen.dart';
import 'package:tmp/mobex/add_resepe_screen.dart';
import 'package:tmp/mobex/delete_screen.dart';
import 'package:tmp/mobex/login.dart';
import 'package:tmp/mobex/product_screen.dart';
import 'package:tmp/mobex/quets_screen.dart';
import 'package:tmp/mobex/register_screen.dart';
import 'package:tmp/mobex/resepe_screen.dart';
import 'package:tmp/product/product_list.dart';
import 'package:tmp/provider/job_provider.dart';
import 'package:tmp/provider/job_screen.dart';
import 'package:tmp/provider/user_provider.dart';
import 'package:tmp/valuelisneber/count.dart';

import 'animation/ripple_animation.dart';
import 'anime_api/anime_screen.dart';
import 'anime_api/vehical_screen.dart';
import 'facker/fack_screen.dart';
import 'glass_kit/glass_kit_screen.dart';
import 'icon/icon_screen.dart';
import 'mobex/image_upload.dart';
import 'mobex/product_search_page.dart';
import 'orientation/orintation_screen.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => JobProvider(),)
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 959),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          locale: Locale("en","US"),
          fallbackLocale: Locale("hi","IN"),
          translations: Language(),
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: JobScreen(),
        );
      },
    );
  }
}


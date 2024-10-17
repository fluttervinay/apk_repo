import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class Home1 extends StatefulWidget {
  const Home1({super.key});

  @override
  State<Home1> createState() => _HomeState();
}

class _HomeState extends State<Home1> {

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
        title: Text('Home'),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                    height: 300.h,
                    width: 300.w,
                    child: Image(image: NetworkImage('https://strapi.dhiwise.com/uploads/flutter_status_bar_color_OG_Image_cecf51dd22.png'))),

                SizedBox(
                    height: 300.h,
                    width: 300.w,
                    child: Image(image: NetworkImage('https://strapi.dhiwise.com/uploads/flutter_status_bar_color_OG_Image_cecf51dd22.png'))),

                SizedBox(
                    height: 300.h,
                    width: 300.w,
                    child: Image(image: NetworkImage('https://strapi.dhiwise.com/uploads/flutter_status_bar_color_OG_Image_cecf51dd22.png'))),

                SizedBox(
                    height: 300.h,
                    width: 300.w,
                    child: Image(image: NetworkImage('https://strapi.dhiwise.com/uploads/flutter_status_bar_color_OG_Image_cecf51dd22.png'))),
                SizedBox(
                    height: 300.h,
                    width: 300.w,
                    child: Image(image: NetworkImage('https://strapi.dhiwise.com/uploads/flutter_status_bar_color_OG_Image_cecf51dd22.png'))),
              ],
            )
          ),
          
          SizedBox(height: 20.h,),
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book'),
          ),

      Container(
        margin: EdgeInsets.fromLTRB(17, 0, 15, 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12).r,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x0A000000),
              offset: Offset(0, 0),
              blurRadius: 2.5,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(10.2, 10, 10.8, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 4).r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '#INV-000001',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 10.sp,
                        color: Color(0xFF537188),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '23 Jul, 24',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 10.sp,
                            color: Color(0xFF537188),
                          ),
                        ),
                        SizedBox(width: 7.w),
                        GestureDetector(
                          onTap: () {
                          },
                          child: Icon(
                            Icons.more_vert,
                            size: 15.sp,
                            color: Color(0xFF537188),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Status',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 8.sp,
                            color: Color(0xFF537188),
                          ),
                        ),
                        Text(
                          'Sent',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 10.sp,
                            color: Color(0xFF808080),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Due Date',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 8.sp,
                            color: Color(0xFF537188),
                          ),
                        ),
                        Text(
                          '25 Jul, 24',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 10.sp,
                            color: Color(0xFF808080),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Amount',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 8.sp,
                            color: Color(0xFF537188),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.currency_rupee,
                              size: 12.sp,
                              color: Color(0xFF808080),
                            ),
                            Text(
                              '5000.00',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 10.sp,
                                color: Color(0xFF808080),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Balance Due',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 8.sp,
                            color: Color(0xFF537188),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.currency_rupee,
                              size: 12.sp,
                              color: Color(0xFF808080),
                            ),
                            Text(
                              '5000.00',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 10.sp,
                                color: Color(0xFF808080),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
        ],
      ),
    );
  }
}

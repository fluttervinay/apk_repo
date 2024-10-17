import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class InvoiceAppScreen extends StatefulWidget {
  @override
  State<InvoiceAppScreen> createState() => _InvoiceAppScreenState();
}

class _InvoiceAppScreenState extends State<InvoiceAppScreen> {
  @override
  void initState() {
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
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            color: const Color(0xff7c94b6),
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.dstATop,
              ),
              image: NetworkImage(
                'https://i.pinimg.com/236x/99/d9/54/99d954303bc7de063b545cd1ad3f34d3.jpg',
              ),
            ),
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(24, 82, 23.7, 38),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  left: -25,
                  bottom: -38,
                  child: Container(
                    width: 361.w,
                    height: 546.h,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(42).r,
                        topRight: Radius.circular(42).r,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0).w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Add TabBar here with custom indicator
                          Center(
                            child: SizedBox(
                              height: 48.h,
                              width: 328.w,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: HexColor("#537188"),
                                  borderRadius: BorderRadius.circular(25).r,
                                ),
                                child: TabBar(
                                  labelColor: Colors.white,
                                  unselectedLabelColor: Colors.white,
                                  dividerColor: Colors.transparent,
                                  labelStyle: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                  indicator: BoxDecoration(
                                    color: HexColor("#CBB279"), // Active tab background color
                                    borderRadius: BorderRadius.circular(25).r,
                                  ),
                                  tabs: [
                                    Container(
                                        width: 150.w,
                                        child: Tab(text: 'Login')),

                                    Container(
                                        width: 150.w,
                                        child: Tab(text: 'Sign Up')),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30.h),
                          Expanded(
                            child: TabBarView(
                              children: [
                                _buildLoginTab(), // Login content
                                _buildSignUpTab(), // Sign Up content
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0.3, 169),
                        child: Text(
                          'INVOICE\nAPP',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            fontSize: 35.sp,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 50.h,
          child: TextField(
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
            ),
            decoration: InputDecoration(
              filled: true,
              hintText: 'Enter Email Address',
              hintStyle: TextStyle(color: HexColor('#959595')),
              fillColor: HexColor("#F1F1F1"),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20).r,
              ),
            ),
          ),
        ),
        SizedBox(height: 20.h),
        Center(
          child: Text(
            'Enter OTP',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
              color: Color(0xFF959595),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _otpBox(),
            _otpBox(),
            _otpBox(),
            _otpBox(),
          ],
        ),
        SizedBox(height: 10.h),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Resend OTP',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 13.sp,
              color: Color(0xFF959595),
            ),
          ),
        ),
        SizedBox(height: 40.h),
        Center(
          child: ElevatedButton(onPressed: () {
            // Login action
          }, child: Text('Login')),
        ),
      ],
    );
  }

  Widget _buildSignUpTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [Color(0xFF537188), Color(0xFFCBB279)],
              tileMode: TileMode.mirror,
            ).createShader(bounds),
            child: Text(
              'Sign Up With OTP',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(height: 30.h),
        SizedBox(
          height: 50.h,
          child: TextField(
            style: GoogleFonts.poppins(
              fontSize: 12.sp,
            ),
            decoration: InputDecoration(
              filled: true,
              hintText: 'Enter Email Address',
              hintStyle: TextStyle(color: HexColor('#959595')),
              fillColor: HexColor("#F1F1F1"),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20).h,
              ),
            ),
          ),
        ),
        SizedBox(height: 20.h),
        Center(
          child: Text(
            'Enter OTP',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
              color: Color(0xFF959595),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _otpBox(),
            _otpBox(),
            _otpBox(),
            _otpBox(),
          ],
        ),
        SizedBox(height: 10.h),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Resend OTP',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 13.sp,
              color: Color(0xFF959595),
            ),
          ),
        ),
        SizedBox(height: 40.h),
        Center(
          child: ElevatedButton(onPressed: () {
            // Sign Up action
          }, child: Text('Sign Up')),
        ),
      ],
    );
  }

  Widget _otpBox() {
    return Container(
      width: 58.02.w,
      height: 45.29.h,
      decoration: BoxDecoration(
        color: HexColor('#F1F1F1'),
        borderRadius: BorderRadius.circular(16).r,
      ),
      child: Center(
        child: TextField(
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 24.sp,
            color: Color(0xFF352E5E),
          ),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            border: InputBorder.none,
            counterText: "",
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({super.key}); // Add a constructor
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.h),
      child: Container(
        width: double.infinity,
        height: ScreenUtil().setHeight(300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r), topRight: Radius.circular(10.r)),
          color: Colors.grey[300],
          image: DecorationImage(
            opacity: 0.30,
            colorFilter:
                ColorFilter.mode(Colors.grey[400]!, BlendMode.modulate),
            image:
                const AssetImage('images/background_images/konkan_gym_bg.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: ScreenUtil().setWidth(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                'Eat Fit 💪',
                style: GoogleFonts.nunito(
                  fontSize: 35.sp,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                'Feel Lit 🔥',
                style: GoogleFonts.nunito(
                  fontSize: 45.sp,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

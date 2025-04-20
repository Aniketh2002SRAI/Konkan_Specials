import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({super.key}); // Add a constructor

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(300), // Using ScreenUtil here
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        image: const DecorationImage(
          opacity: 0.35,
          image: AssetImage('images/background_images/konkan_background.jpeg'),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: const Offset(0, 5),
            spreadRadius: 4,
            blurRadius: 4,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(left: ScreenUtil().setWidth(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Konkan❤️',
                      style: GoogleFonts.nunito(
                        fontSize: 50,
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w900,
                        height: 0.2,
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(left: ScreenUtil().setWidth(28)),
                      child: Text(
                        'Specials',
                        style: GoogleFonts.nunito(
                          fontSize: 30,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Inspired by coastal\nkonkan!',
              style: GoogleFonts.nunito(
                fontSize: 20.sp,
                color: Colors.grey[800],
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

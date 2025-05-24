import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarosuelWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(15.0)),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 200.h,
          viewportFraction: 0.85,
          autoPlay: true,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
        ),
        items: sliderImages.map((item) {
          return 
               Container(
                width: MediaQuery.of(context).size.width * 0.85,
                margin: EdgeInsets.symmetric(horizontal: 1.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: Image.asset(
                    item,
                    fit: BoxFit.cover,
                  ),
                ),
              );
           
        }).toList(),
      ),
    );
  }
}

List<String> sliderImages = [
  'images/caraosel_images/caraousel_image1.jpeg',
  'images/caraosel_images/caraousel_image2.jpeg',
  'images/caraosel_images/caraousel_image3.jpeg',
];

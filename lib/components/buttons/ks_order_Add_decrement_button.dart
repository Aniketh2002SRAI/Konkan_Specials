import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ksOrderAddDecrementButton extends StatelessWidget {
  final double borderRadius;
  final bool showIcons;
  final bool shouldEnable;

  final String text;
  final VoidCallback onTap;
  final VoidCallback addTap;
  final VoidCallback decrementTap;

  const ksOrderAddDecrementButton(
      {super.key,
      this.borderRadius = 0,
      required this.shouldEnable,
      required this.showIcons,
      required this.text,
      required this.onTap,
      required this.addTap,
      required this.decrementTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: shouldEnable ? onTap : () {},
      child: Stack(children: [
        Container(
          height: ScreenUtil().setHeight(40),
          width: ScreenUtil().setWidth(120),
          decoration: BoxDecoration(
            color: shouldEnable ? Colors.green : Colors.grey,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              showIcons
                  ? InkWell(
                      onTap: decrementTap,
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                        size: 25,
                        weight: 700,
                      ),
                    )
                  : SizedBox.shrink(),
              Text(text,
                  style: GoogleFonts.nunito(
                      color: shouldEnable ? Colors.white : Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700)),
              showIcons
                  ? InkWell(
                      onTap: addTap,
                      child: Icon(
                        Icons.add_rounded,
                        color: Colors.white,
                        size: 25,
                        weight: 700,
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ),
        !showIcons
            ? Positioned(
                top: ScreenUtil().setHeight(5),
                right: ScreenUtil().setWidth(5),
                child: Icon(
                  Icons.add_rounded,
                  color: shouldEnable ? Colors.white : Colors.black,
                  size: 18,
                ),
              )
            : SizedBox.shrink(),
      ]),
    );
  }
}

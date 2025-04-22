import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class KsAppButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const KsAppButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.green,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(10.0)),
          child: Text(text,
              style: GoogleFonts.nunito(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.center),
        ),
      ),
    );
  }
}

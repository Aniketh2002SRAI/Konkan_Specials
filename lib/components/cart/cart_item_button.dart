import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CartItemButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback decrementTap;
  final VoidCallback incrementTap;
  const CartItemButton(
      {super.key,
      required this.buttonText,
      required this.decrementTap,
      required this.incrementTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(5),
        vertical: ScreenUtil().setHeight(5),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.green),
      ),
      child: Row(
        children: [
          _decrementIncrementButton(icon: Icons.remove, onTap: decrementTap),
          _btnText(),
          _decrementIncrementButton(icon: Icons.add, onTap: incrementTap),
        ],
      ),
    );
  }

  Widget _btnText() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(5),
      ),
      child: Text(buttonText,
          style: GoogleFonts.nunito(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.green)),
    );
  }

  Widget _decrementIncrementButton(
      {required VoidCallback onTap, required IconData icon}) {
    return Row(
      children: [
        InkWell(
          onTap: onTap,
          child: Icon(
            icon,
            color: Colors.black,
            size: 15,
          ),
        ),
      ],
    );
  }
}

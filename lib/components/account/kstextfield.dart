import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class KsTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final bool isPassword;
  final bool isPhoneNumber;
  final Function(String) onChanged;
  final String? Function(String?)? validator;
  KsTextField(
      {super.key,
      required this.label,
      required this.controller,
      this.isPassword = false,
      this.isPhoneNumber = false,
      required this.onChanged,
      required this.validator});

  @override
  State<KsTextField> createState() => _KsTextFieldState();
}

class _KsTextFieldState extends State<KsTextField> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(15)),
      child: Container(
        child: TextFormField(
          textInputAction: TextInputAction.done,
          keyboardType: widget.isPassword
              ? TextInputType.visiblePassword
              : TextInputType.text,
          inputFormatters: widget.isPhoneNumber
              ? [FilteringTextInputFormatter.digitsOnly]
              : [],
          validator: widget.validator,
          onChanged: widget.onChanged,
          controller: widget.controller,
          obscureText: widget.isPassword
              ? !showPassword
                  ? true
                  : false
              : false,
          decoration: InputDecoration(
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(!showPassword
                        ? Icons.visibility
                        : Icons.visibility_off),
                  )
                : null,
            hintText: widget.label,
            hintStyle: GoogleFonts.nunito(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.green),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.green),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.green),
            ),
          ),
        ),
      ),
    );
  }
}

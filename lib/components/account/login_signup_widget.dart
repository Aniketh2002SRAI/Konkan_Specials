import 'package:flutter/material.dart';
import 'package:konkanspecials/view/account.dart';

class LoginSignUpWidget extends StatelessWidget {
  const LoginSignUpWidget({super.key, required this.loginType});
  final LoginType loginType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        loginType == LoginType.login ? Text("Login") : Text("Sign Up"),
      ],
    );
  }
}



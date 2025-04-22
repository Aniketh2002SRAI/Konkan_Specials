import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:konkanspecials/components/buttons/ks_app_button.dart';
import 'package:konkanspecials/view/account.dart';
import 'package:konkanspecials/viewmodel/account_view_model.dart';

class InitialAccountLayout extends StatelessWidget {
  final AccountViewModel accountViewModel;
  const InitialAccountLayout({super.key, required this.accountViewModel});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(15.0)),
        child: KsAppButton(
          text: 'Login',
          onTap: () {
            accountViewModel.setLoginType(LoginType.login);
          },
        ),
      ),
      SizedBox(height: 10),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(15.0)),
        child: KsAppButton(
          text: 'Sign Up',
          onTap: () {
            accountViewModel.setLoginType(LoginType.signup);
          },
        ),
      )
    ]);
  }
}

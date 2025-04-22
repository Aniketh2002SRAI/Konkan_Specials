import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konkanspecials/components/account/inital_account_layout.dart';
import 'package:konkanspecials/components/account/login_signup_widget.dart';
import 'package:konkanspecials/components/account/user_widget.dart';
import 'package:konkanspecials/components/appbar/ks_app_bar.dart';
import 'package:konkanspecials/constants/constants.dart';
import 'package:konkanspecials/viewmodel/account_view_model.dart';
import 'package:provider/provider.dart';

class Account extends StatelessWidget {
  Account({super.key});
  LoginType loginType = LoginType.inital;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: ksAppBar(
        titleWidget: Text(
          'Account',
          style: appBarTitleStyle,
        ),
      ),
      body: SafeArea(
        child: _loginSignUpScreenBody(),
      ),
    );
  }

  Widget _loginSignUpScreenBody() {
    return Consumer<AccountViewModel>(
        builder: (context, accountViewModel, child) {
      return Column(
        children: [..._getBody(accountViewModel: accountViewModel)],
      );
    });
  }

  List<Widget> _getBody({required AccountViewModel accountViewModel}) {
    return [
      _imageWidget(),
      _descriptionWidget(),
      SizedBox(height: ScreenUtil().setHeight(10.0)),
      _getLayout(accountViewModel: accountViewModel)
    ];
  }

  Widget _getLayout({required AccountViewModel accountViewModel}) {
    switch (accountViewModel.loginType) {
      case LoginType.inital:
        return InitialAccountLayout(accountViewModel: accountViewModel);
      case LoginType.login:
        return LoginSignUpWidget(loginType: LoginType.login);
      case LoginType.signup:
        return LoginSignUpWidget(loginType: LoginType.signup);
      case LoginType.user:
        return UserWidget();
    }
  }

  Widget _imageWidget() {
    return Container(
      height: ScreenUtil().setHeight(200),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
            image:
                AssetImage('images/background_images/konkan_background.jpeg'),
            fit: BoxFit.fill),
      ),
    );
  }

  Widget _descriptionWidget() {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(15.0),
                top: ScreenUtil().setHeight(8.0)),
            child: Container(
              child: Text(
                'Login/Create Account to manage orders',
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[700],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

enum LoginType { inital, login, signup, user }

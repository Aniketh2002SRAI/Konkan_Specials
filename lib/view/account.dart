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
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AccountViewModel>(
        builder: (context, accountViewModel, child) {
      return Scaffold(
        backgroundColor: appBackgroundColor,
        appBar: ksAppBar(
          titleWidget: Text('Account', style: appBarTitleStyle),
          leadingIcon: _getLeadingIcon(loginType: accountViewModel.loginType),
          onLeadingIconTap: () {
            _getOnLeadingIconTap(
                loginType: accountViewModel.loginType,
                accountViewModel: accountViewModel);
          },
        ),
        body: SafeArea(
          child: _loginSignUpScreenBody(),
        ),
      );
    });
  }

  void _getOnLeadingIconTap(
      {required LoginType loginType,
      required AccountViewModel accountViewModel}) {
    switch (loginType) {
      case LoginType.initial:
      case LoginType.user:
        () {};
        break;
      case LoginType.login:
      case LoginType.signup:
        accountViewModel.setLoginType(LoginType.initial);
        break;
      case LoginType.forgotPassword:
        accountViewModel.setLoginType(LoginType.login);
        break;
    }
  }

  IconData? _getLeadingIcon({required LoginType loginType}) {
    switch (loginType) {
      case LoginType.initial:
      case LoginType.user:
        return null;
      case LoginType.login:
      case LoginType.signup:
      case LoginType.forgotPassword:
        return Icons.chevron_left;
      default:
        return null;
    }
  }

  Widget _loginSignUpScreenBody() {
    return Consumer<AccountViewModel>(
      builder: (context, accountViewModel, child) {
        return Column(
          children: [..._getBody(accountViewModel: accountViewModel)],
        );
      },
    );
  }

  List<Widget> _getBody({required AccountViewModel accountViewModel}) {
    return [
      _imageWidget(),
      _descriptionWidget(accountViewModel: accountViewModel),
      SizedBox(height: ScreenUtil().setHeight(10.0)),
      _getLayout(accountViewModel: accountViewModel)
    ];
  }

  Widget _getLayout({required AccountViewModel accountViewModel}) {
    switch (accountViewModel.loginType) {
      case LoginType.initial:
        return InitialAccountLayout(accountViewModel: accountViewModel);
      case LoginType.login:
      case LoginType.forgotPassword:
        return LoginSignUpWidget(
            loginType: LoginType.login, accountViewModel: accountViewModel);
      case LoginType.signup:
        return LoginSignUpWidget(
            loginType: LoginType.signup, accountViewModel: accountViewModel);
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
          image: AssetImage('images/background_images/konkan_background.jpeg'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _descriptionWidget({required AccountViewModel accountViewModel}) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(15.0),
              top: ScreenUtil().setHeight(8.0),
            ),
            child: Container(
              child: Text(
                _getText(accountViewModel: accountViewModel),
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

  String _getText({required AccountViewModel accountViewModel}) {
    switch (accountViewModel.loginType) {
      case LoginType.initial:
        return 'Login/Create Account to manage orders';
      case LoginType.login:
        return 'Login to manage orders';
      case LoginType.signup:
        return 'Signup to manage orders';
      default:
        return '';
    }
  }
}

enum LoginType { initial, login, signup, user, forgotPassword }

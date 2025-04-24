import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:konkanspecials/components/account/is_existing_new_user_forgot_password_widget.dart';
import 'package:konkanspecials/components/account/kstextfield.dart';
import 'package:konkanspecials/components/buttons/ks_app_button.dart';
import 'package:konkanspecials/model/login_signup_model/validators.dart';
import 'package:konkanspecials/view/account.dart';
import 'package:konkanspecials/viewmodel/account_view_model.dart';

class LoginSignUpWidget extends StatelessWidget {
  final AccountViewModel accountViewModel;
  LoginSignUpWidget(
      {super.key, required this.loginType, required this.accountViewModel});
  final LoginType loginType;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(15)),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    ..._namePhonenumberWidget(),
                    _emailWidget(),
                    ..._passwordWidget(),
                    _forgotPasswordWidget(),
                    _loginSignUpButton(), //
                    _isLoggedInWidget(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _forgotPasswordWidget() {
    return accountViewModel.loginType == LoginType.login
        ? Padding(
            padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(10.0),
                right: ScreenUtil().setWidth(15)),
            child: Align(
              alignment: Alignment.centerRight,
              child: IsExistingNewUserForgotPasswordWidgetWidget(
                isForgotPassword: true,
                accountViewModel: accountViewModel,
                loginType: LoginType.forgotPassword,
              ),
            ),
          )
        : SizedBox.shrink();
  }

  Widget _isLoggedInWidget() {
    return IsExistingNewUserForgotPasswordWidgetWidget(
      accountViewModel: accountViewModel,
      loginType: accountViewModel.loginType,
    );
  }

  Widget _loginSignUpButton() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(15),
          vertical: ScreenUtil().setHeight(15)),
      child: KsAppButton(
        text: _getButtonText(),
        onTap: () {
          _buttonOnTap();
        },
      ),
    );
  }

  void _buttonOnTap() {
    switch (accountViewModel.loginType) {
      case LoginType.forgotPassword:
        ();
        break;
      case LoginType.login:
        ();
        break;
      case LoginType.signup:
        ();
        break;
      default:
        break;
    }
  }

  String _getButtonText() {
    switch (accountViewModel.loginType) {
      case LoginType.forgotPassword:
        return 'Reset Password';
      case LoginType.login:
        return 'Login';
      case LoginType.signup:
        return 'Sign Up';
      default:
        return '';
    }
  }

  List<Widget> _passwordWidget() {
    return [
      Padding(
        padding: EdgeInsets.only(top: ScreenUtil().setHeight(10.0)),
        child: KsTextField(
          isPassword: true,
          validator: (value) {
            return accountViewModel.loginType == LoginType.signup
                ? Validators.instance
                    .validatePassword(value.toString(), isLogin: false)
                : Validators.instance
                    .validatePassword(value.toString(), isLogin: true);
          },
          label: accountViewModel.loginType == LoginType.login
              ? 'Password'
              : 'New Password',
          controller: _passwordController,
          onChanged: (value) {
            print('value: $value');
            _passwordController.text = value;
          },
        ),
      ),
      if (accountViewModel.loginType == LoginType.signup ||
          accountViewModel.loginType == LoginType.forgotPassword)
        Padding(
            padding: EdgeInsets.only(top: ScreenUtil().setHeight(10.0)),
            child: KsTextField(
              isPassword: true,
              validator: (value) {
                return Validators.instance.validateConfirmPassword(
                    value.toString(),
                    password: _passwordController.text);
              },
              label: 'Confirm Password',
              controller: _confirmPasswordController,
              onChanged: (value) {
                print('value: $value');
              },
            ))
    ];
  }

  Widget _emailWidget() {
    return KsTextField(
      controller: _emailController,
      label: 'Email',
      validator: (value) {
        return Validators.instance.validateEmail(value.toString());
      },
      onChanged: (value) {
        _emailController.text = value;
      },
    );
  }

  List<Widget> _namePhonenumberWidget() {
    return accountViewModel.loginType == LoginType.signup
        ? [
            Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(10.0)),
              child: KsTextField(
                label: 'Name',
                controller: _nameController,
                onChanged: (value) {
                  _nameController.text = value;
                },
                validator: (value) {
                  return Validators.instance.validateName(value.toString());
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: ScreenUtil().setHeight(10.0),
                  bottom: ScreenUtil().setHeight(10.0)),
              child: KsTextField(
                isPhoneNumber: true,
                label: 'Phone Number',
                controller: _phoneNumberController,
                onChanged: (value) {
                  _phoneNumberController.text = value;
                },
                validator: (value) {
                  return Validators.instance
                      .validatePhoneNumber(value.toString());
                },
              ),
            ),
          ]
        : [];
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:konkanspecials/components/account/is_existing_new_user_widget.dart';
import 'package:konkanspecials/components/account/kstextfield.dart';
import 'package:konkanspecials/components/buttons/ks_app_button.dart';
import 'package:konkanspecials/view/account.dart';
import 'package:konkanspecials/viewmodel/account_view_model.dart';
import 'package:provider/provider.dart';

class LoginSignUpWidget extends StatelessWidget {
  LoginSignUpWidget({super.key, required this.loginType});
  final LoginType loginType;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                    ..._namePhonenumberWidget(loginType: loginType),
                    _emialWidget(),
                    ..._passwordWidget(loginType: loginType),
                    _loginSignUpButton(loginType: loginType),
                    _isLoggedInWidget(loginType: loginType),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _isLoggedInWidget({required LoginType loginType}) {
    return Consumer<AccountViewModel>(
        builder: (context, accountViewModel, child) {
      return IsExistingNewUserWidget(
        accountViewModel: accountViewModel,
        loginType: loginType,
      );
    });
  }

  Widget _loginSignUpButton({required LoginType loginType}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(15),
          vertical: ScreenUtil().setHeight(15)),
      child: KsAppButton(
        text: loginType == LoginType.login ? 'Login' : 'Sign Up',
        onTap: () {
          if (_formKey.currentState!.validate()) {
            print('Form is valid');
          }
        },
      ),
    );
  }

  List<Widget> _passwordWidget({required LoginType loginType}) {
    return [
      Padding(
        padding: EdgeInsets.only(top: ScreenUtil().setHeight(10.0)),
        child: KsTextField(
          isPassword: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Password is required';
            }
            return null;
          },
          label: loginType == LoginType.login ? 'Password' : 'New Password',
          controller: TextEditingController(),
          onChanged: (value) {
            print('value: $value');
          },
        ),
      ),
      if (loginType == LoginType.signup)
        Padding(
            padding: EdgeInsets.only(top: ScreenUtil().setHeight(10.0)),
            child: KsTextField(
              isPassword: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Confirm Password is required';
                }
                return null;
              },
              label: 'Confirm Password',
              controller: TextEditingController(),
              onChanged: (value) {
                print('value: $value');
              },
            ))
    ];
  }

  Widget _emialWidget() {
    return KsTextField(
      label: 'Email',
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email is required';
        }
        return null;
      },
      controller: TextEditingController(),
      onChanged: (value) {
        print('value: $value');
      },
    );
  }

  List<Widget> _namePhonenumberWidget({required LoginType loginType}) {
    return loginType == LoginType.signup
        ? [
            Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(10.0)),
              child: KsTextField(
                label: 'Name',
                controller: TextEditingController(),
                onChanged: (value) {
                  print('value: $value');
                },
                validator: (value) {
                  return null;
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
                controller: TextEditingController(),
                onChanged: (value) {
                  print('value: $value');
                },
                validator: (value) {
                  return null;
                },
              ),
            ),
          ]
        : [];
  }
}

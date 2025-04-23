import 'package:flutter/material.dart';
import 'package:konkanspecials/view/account.dart';

class AccountViewModel extends ChangeNotifier {
  LoginType loginType = LoginType.initial;

  void setLoginType(LoginType loginType) {
    this.loginType = loginType;
    notifyListeners();
  }
}

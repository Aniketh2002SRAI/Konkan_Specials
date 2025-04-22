import 'package:flutter/material.dart';
import 'package:konkanspecials/view/account.dart';

class AccountViewModel extends ChangeNotifier {
  LoginType loginType = LoginType.inital;

  void setLoginType(LoginType loginType) {
    this.loginType = loginType;
    notifyListeners();
  }
}

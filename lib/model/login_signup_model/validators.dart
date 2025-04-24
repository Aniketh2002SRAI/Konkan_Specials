class Validators {
  static Validators instance = Validators._();
  Validators._();

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
    );

    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email ';
    }

    return null;
  }

  String? validatePassword(String value, {required bool isLogin}) {
    if (value.isEmpty) {
      return 'Password is required';
    }

    if (!isLogin) {
      if (value.length < 6) {
        return 'Length must be at least 6 characters';
      }
    }

    return null;
  }

  String? validatePhoneNumber(String value) {
    if (value.isEmpty) {
      return 'Phone number is required';
    }

    if (value.length != 10) {
      return 'Phone number must be 10 digits';
    }

    return null;
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return 'Name is required';
    } else
      return null;
  }

  String? validateConfirmPassword(String value, {required String password}) {
    if (value.isEmpty) {
      return 'Confirm Password is required';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }
}

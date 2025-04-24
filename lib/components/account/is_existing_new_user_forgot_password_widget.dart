import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konkanspecials/view/account.dart';
import 'package:konkanspecials/viewmodel/account_view_model.dart';

class IsExistingNewUserForgotPasswordWidgetWidget extends StatelessWidget {
  final bool? isForgotPassword;
  final LoginType loginType;
  final AccountViewModel accountViewModel;

  const IsExistingNewUserForgotPasswordWidgetWidget({
    super.key,
    this.isForgotPassword = false,
    required this.loginType,
    required this.accountViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return _isExistingNewUserWidget(loginType);
  }

  Widget _isExistingNewUserWidget(LoginType loginType) {
    if (isForgotPassword == true) {
      return _buildRichText(
        prompt: 'Forgot Password? ',
        actionText: 'Click Here',
        onTap: () {
          accountViewModel.setLoginType(LoginType.forgotPassword);
        },
      );
    }
    switch (loginType) {
      case LoginType.login:
        return _buildRichText(
          prompt: isForgotPassword == true ? 'Forgot Password? ' : 'New User? ',
          actionText: isForgotPassword == true ? 'Click Here' : 'Sign Up',
          onTap: () {
            accountViewModel.setLoginType(LoginType.signup);
          },
        );
      case LoginType.signup:
        return _buildRichText(
          prompt: 'Existing User? ',
          actionText: 'Login',
          onTap: () {
            accountViewModel.setLoginType(LoginType.login);
          },
        );

      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildRichText({
    required String prompt,
    required String actionText,
    required VoidCallback onTap,
  }) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: prompt,
            style: GoogleFonts.nunito(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: actionText,
            style: GoogleFonts.nunito(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.blue,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}

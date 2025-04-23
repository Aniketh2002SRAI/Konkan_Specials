import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konkanspecials/view/account.dart';
import 'package:konkanspecials/viewmodel/account_view_model.dart';

class IsExistingNewUserWidget extends StatelessWidget {
  final LoginType loginType;
  final AccountViewModel accountViewModel;

  const IsExistingNewUserWidget({
    super.key,
    required this.loginType,
    required this.accountViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return _isExistingNewUserWidget(loginType);
  }

  Widget _isExistingNewUserWidget(LoginType loginType) {
    switch (loginType) {
      case LoginType.login:
        return _buildRichText(
          prompt: 'New User? ',
          actionText: 'Sign Up',
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

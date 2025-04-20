import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:konkanspecials/components/buttons/icon_button_widget.dart';
import 'package:konkanspecials/view/homepage.dart';

class ksAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ksAppBar({
    super.key,
    required this.leadingIcon,
    required this.onLeadingIconTap,
    required this.itemCategory,
  });

  final IconData leadingIcon;
  final ItemCategory itemCategory;
  final VoidCallback onLeadingIconTap;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        itemCategory.emoji + '  ' + itemCategory.name,
        style: GoogleFonts.shantellSans(
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.w700,
        ),
      ),
      centerTitle: true,
      leading: IconButtonWidget(icon: leadingIcon, onTap: onLeadingIconTap),
    );
  }
}

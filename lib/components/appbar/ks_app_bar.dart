import 'package:flutter/material.dart';
import 'package:konkanspecials/components/buttons/icon_button_widget.dart';

class ksAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ksAppBar({
    super.key,
    this.leadingIcon,
    this.onLeadingIconTap,
    required this.titleWidget,
  });

  final IconData? leadingIcon;
  final Widget titleWidget;
  final VoidCallback? onLeadingIconTap;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      title: titleWidget,
      centerTitle: true,
      leading: leadingIcon != null
          ? IconButtonWidget(icon: leadingIcon!, onTap: onLeadingIconTap!)
          : null,
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/resources/resources.dart';

class ControlTableButton extends StatelessWidget {
  final Icon icon;
  final void Function() onPressed;
  const ControlTableButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all<Color>(R.colors.primaryColor),
        backgroundColor: WidgetStateProperty.all<Color>(
          const Color(0xFFF4F4F4),
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
      ),
    );
  }
}

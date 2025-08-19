import 'package:flutter/material.dart';

class Buttom extends StatelessWidget {
  final void Function()? onPressed;
  final Widget child;
  final IconData? icon;
  final Color? color;

  const Buttom({
    super.key,
    this.onPressed,
    required this.child,
    this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: Theme.of(context).elevatedButtonTheme.style,
      child: SizedBox(
        width: 300,
        height: 40,
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(icon, size: 25, color: Colors.white), // لون الأيقونة
                const SizedBox(width: 8), // مسافة بين الأيقونة والنص
              ],
              child,
            ],
          ),
        ),
      ),
    );
  }
}

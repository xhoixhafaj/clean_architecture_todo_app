import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget implements PreferredSizeWidget {
  PrimaryButton({
    required this.text,
    required this.onPressed,
    this.textStyle,
    this.width,
    this.height,
    this.prefixIcon,
    this.suffixIcon,
    super.key,
  });

  final String text;
  final VoidCallback? onPressed;
  late TextStyle? textStyle;
  final double? width;
  final double? height;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: preferredSize.width,
      height: preferredSize.height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          enableFeedback: true,
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          side: MaterialStateProperty.resolveWith<BorderSide>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                );
              }
              if (states.contains(MaterialState.hovered)) {
                return BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                );
              }
              if (states.contains(MaterialState.disabled)) {
                return BorderSide(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                  width: 0,
                );
              }
              return BorderSide(
                color: Theme.of(context).colorScheme.primary,
              );
            },
          ),
          elevation: MaterialStateProperty.resolveWith<double?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return 0.0;
              }
              if (states.contains(MaterialState.hovered)) {
                return 5.0;
              }
              if (states.contains(MaterialState.focused) ||
                  states.contains(MaterialState.pressed)) {
                return 5.0;
              }
              return 1.0;
            },
          ),
          foregroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return Theme.of(context).colorScheme.onBackground;
              }
              if (states.contains(MaterialState.hovered)) {
                return Theme.of(context).colorScheme.onPrimary;
              }
              if (states.contains(MaterialState.focused) ||
                  states.contains(MaterialState.pressed)) {
                return Theme.of(context).colorScheme.onPrimary;
              }
              return Theme.of(context).colorScheme.onPrimary;
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return Theme.of(context).colorScheme.primary.withOpacity(0.5);
              }
              if (states.contains(MaterialState.hovered) ||
                  states.contains(MaterialState.focused)) {
                return Theme.of(context).colorScheme.primary;
              }
              return Theme.of(context).colorScheme.primary;
            },
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefixIcon != null)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: prefixIcon!,
              ),
            Flexible(
              child: Text(
                text,
                style: textStyle ??
                    Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ),
            if (suffixIcon != null)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: suffixIcon!,
              ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(width ?? double.infinity, height ?? 48.h);
}

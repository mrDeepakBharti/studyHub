import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customButton extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final double borderWidth;
  final Color? borderColor;
  final EdgeInsetsGeometry padding;
  final Color textColor;
  final VoidCallback onPressed;
  final TextStyle style;
  final IconData? icon;
  const customButton(
      {Key? key,
      required this.title,
      this.icon,
      this.backgroundColor = Colors.blue,
      this.padding = const EdgeInsets.all(16.0),
      this.textColor = Colors.white,
      required this.onPressed,
      required this.style,
      this.borderColor,
      this.borderWidth = 1.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
              color: borderColor ?? Colors.transparent, width: borderWidth),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null
                ? Icon(
                    icon,
                    color: Colors.white,
                  )
                : SizedBox.shrink(),
            icon != null
                ? SizedBox(width: 8.w)
                : SizedBox
                    .shrink(), // Adjust the spacing between the icon and the text
            Text(
              title,
              textAlign: TextAlign.center,
              style: style,
            ),
          ],
        ),
      ),
    );
  }
}

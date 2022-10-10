import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.label,
    required this.onPress,
    this.labelFontSize = 17,
    this.labelColor = Colors.black,
    this.height = 7,
    this.width = 40,
    this.borderRadius = 50.0,
  }) : super(key: key);

  final String label;
  final int labelFontSize;
  final Color labelColor;
  final Function() onPress;
  final int width;
  final int height;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
      minWidth: width.w,
      height: height.h,
      child: Text(
        label,
        style: TextStyle(color: labelColor, fontSize: labelFontSize.sp),
      ),
    );
  }
}

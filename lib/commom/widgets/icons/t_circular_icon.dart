
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class TCircleIcon extends StatelessWidget {
  const TCircleIcon({
    super.key,
    required this.icon,
    this.color,
    this.backgroundColor, this.onPressed, this.width, this.height, this.size,
  });

  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  final double? width, height, size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor != null
            ? backgroundColor!
            : THelperFunctions.isDarkMode(context)
            ? TColors.black.withOpacity(0.9)
            : TColors.white.withOpacity(0.9),
      ),
      child: IconButton(
        icon: Icon(icon, color: color,size: size,),
        onPressed: onPressed,
      ),
    );
  }
}

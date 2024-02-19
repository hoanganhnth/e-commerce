
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';

class TCircleIcon extends StatelessWidget {
  const TCircleIcon({
    super.key,
    required this.icon,
    this.color,
    this.backgroundColor,
  });

  final IconData icon;
  final Color? color;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor != null
            ? backgroundColor!
            : THelperFunctions.isDarkMode(context)
            ? TColors.black.withOpacity(0.9)
            : TColors.white.withOpacity(0.9),
      ),
      child: IconButton(
        icon: Icon(icon, color: color,),
        onPressed: () {},
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.overlayColor,
    this.backgroundColor,
    this.width = 56,
    this.heigh = 56,
    this.padding = TSizes.sm,
  });

  final BoxFit? fit;
  final String image;
  final isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, heigh, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: heigh,
      padding: const EdgeInsets.all(TSizes.sm),
      decoration: BoxDecoration(
          color: backgroundColor ?? (THelperFunctions.isDarkMode(context)
              ? TColors.black
              : TColors.white),
          borderRadius: BorderRadius.circular(100)),
      child: Center(
        child: Image(
          fit:fit,
          image: isNetworkImage ? NetworkImage(image) : AssetImage(image) as ImageProvider,
          color: overlayColor,
        ),
      ),
    );
  }
}

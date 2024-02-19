
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../styles/shadows.dart';
import '../../icons/t_circular_icon.dart';
import '../../images/t_rounded_image.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: EdgeInsets.all(1),
      width: 180,
      decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticleProductShadow],
          color: dark ? TColors.dark : TColors.white,
          borderRadius: BorderRadius.circular(TSizes.productImageRadius)),
      child: Column(
        children: [
          // thumbnail, wishlist, discount
          Container(
            color: dark ? TColors.dark : TColors.white,
            child: Stack(
              children: [
                TRoundedImage(imageUrl: TImages.productImage1),

                // sale
                Positioned(
                  top: 12,
                  left: 0,
                  // rounded container
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.sm, vertical: TSizes.xs),
                    decoration: BoxDecoration(
                        color: TColors.secondary.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(TSizes.sm)),
                    child: Center(
                      child: Text(
                        "25%",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.black),
                      ),
                    ),
                  ),
                ),

                //icon heart
                Positioned(
                  top: 0,
                  right: 0,
                  child: TCircleIcon(icon: Iconsax.heart5, color: Colors.red,),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/commom/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/commom/widgets/icons/t_brand_title_text_with_verified_icon.dart';
import 'package:t_store/commom/widgets/images/t_rounded_image.dart';
import 'package:t_store/commom/widgets/texts/product_price_text.dart';
import 'package:t_store/commom/widgets/texts/product_title_text.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../icons/t_circular_icon.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        color: dark ? TColors.darkGrey : TColors.softGrey,
      ),
      child: Row(
        children: [
          TRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: dark ? TColors.dark : TColors.white,
            child: Stack(children: [
              const TRoundedImage(
                imageUrl: TImages.productImage1,
              ),

              // sale
              Positioned(
                top: 12,
                child: TRoundedContainer(
                  radius: TSizes.sm,
                  backgroundColor: TColors.secondary.withOpacity(0.8),
                  padding: const EdgeInsets.symmetric(
                      horizontal: TSizes.sm, vertical: TSizes.xs),
                  child: Text(
                    "25%",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(color: TColors.black),
                  ),
                ),
              ),

              // icon
              Positioned(
                top: 0,
                right: 0,
                child: const TCircleIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                ),
              ),
            ]),
          ),

          // Title, price, add button
          SizedBox(
            width: 160,
            child: Padding(
              padding: const EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductTileText(title: 'Nike Blazer',smallSize: true,),
                      SizedBox(height: TSizes.spaceBtwItems/2,),
                      TBrandTitleWithVerifiedIcon(title: 'Adidas',),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(child: TProductPriceText(price: '40.0')),
                      Container(
                        decoration: const BoxDecoration(
                            color: TColors.dark,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(TSizes.cardRadiusMd),
                                bottomRight:
                                Radius.circular(TSizes.productImageRadius))),
                        child: const SizedBox(
                            width: TSizes.iconLg * 1.2,
                            height: TSizes.iconLg * 1.2,
                            child: Icon(
                              Iconsax.add,
                              color: Colors.white,
                            )),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

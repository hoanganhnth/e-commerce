import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/commom/widgets/appbar/appbar.dart';
import 'package:t_store/commom/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:t_store/commom/widgets/icons/t_circular_icon.dart';
import 'package:t_store/commom/widgets/images/t_rounded_image.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TCurvedEdgeWidget(
        widget: Container(
      color: dark ? TColors.darkerGrey : TColors.light,
      child: Stack(
        children: [
          // Main large image
          SizedBox(
            height: 400,
            child: Padding(
              padding: EdgeInsets.all(TSizes.productImageRadius * 2),
              child: Center(
                  child: Image(
                image: AssetImage(TImages.productImage5),
              )),
            ),
          ),
          // App bar
          TAppBar(
            showBackArrow: true,
            action: [
              TCircleIcon(
                icon: Iconsax.heart5,
                color: Colors.red,
              )
            ],
          ),

          // Image slider

          Positioned(
            right: 0,
            bottom: 30,
            left: TSizes.defaultSpace,
            child: SizedBox(
              height: 80,
              child: ListView.separated(
                itemCount: 6,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const AlwaysScrollableScrollPhysics(),
                separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return   TRoundedImage(
                    width: 80,
                    imageUrl: TImages.productImage3,
                    padding: const EdgeInsets.all(TSizes.sm),
                    border: Border.all(color: TColors.primary),
                    backgroundColor: dark ? TColors.dark : TColors.white,
                  );
                },
              ),
            ),
          )
        ],
      ),
    ));
  }
}

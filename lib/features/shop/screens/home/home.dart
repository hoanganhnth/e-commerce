import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/commom/styles/shadows.dart';
import 'package:t_store/commom/widgets/custom_shapes/containers/circular_container.dart';
import 'package:t_store/commom/widgets/images/t_rounded_image.dart';

import 'package:t_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_category.dart';
import 'package:t_store/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/device/device_utility.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import '../../../../commom/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../commom/widgets/custom_shapes/containers/search_container.dart';
import '../../../../commom/widgets/icons/t_circular_icon.dart';
import '../../../../commom/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../commom/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../commom/widgets/texts/section_heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
                child: Column(
              children: [
                const THomeAppBar(),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                const TSearchContainer(
                  text: "Search in store",
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: TSizes.defaultSpace),
                  child: Column(
                    children: [
                      TSectionHeading(
                        title: 'Popular Categories',
                        showActionButton: false,
                        textColor: Colors.white,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      const THomeCategory(),
                    ],
                  ),
                ),
              ],
            )),
            // body
            Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  // slider
                  TPromoSlider(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  GridView.builder(
                    itemCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: TSizes.gridViewSpacing,
                        mainAxisSpacing: TSizes.gridViewSpacing),
                    itemBuilder: (BuildContext context, int index) {
                      return TProductCardVertical();
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

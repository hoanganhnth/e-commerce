import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:t_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_category.dart';
import 'package:t_store/features/shop/screens/home/widgets/promo_slider.dart';

import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../commom/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../commom/widgets/custom_shapes/containers/search_container.dart';
import '../../../../commom/widgets/layout/grid_layout.dart';
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
            const TPrimaryHeaderContainer(
                child: Column(
                  children: [
                    THomeAppBar(),
                    SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    TSearchContainer(
                      text: "Search in store",
                    ),
                    SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: TSizes.defaultSpace),
                      child: Column(
                        children: [
                          TSectionHeading(
                            title: 'Popular Categories',
                            showActionButton: false,
                            textColor: Colors.white,
                          ),
                          SizedBox(
                            height: TSizes.spaceBtwItems,
                          ),
                          THomeCategory(),
                        ],
                      ),
                    ),
                SizedBox(
                  height: TSizes.spaceBtwSections,
                )
              ],
            )),
            // body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  // slider
                  const TPromoSlider(
                    banners: [
                      TImages.promoBanner1,
                      TImages.promoBanner2,
                      TImages.promoBanner3
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  TGridLayout(
                    itemCount: 4,
                    itemBuilder: (p0, p1) => const TProductCardVertical(),
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

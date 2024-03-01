import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/features/shop/screens/product_detail/widgets/bottom_add_to_cart_widget.dart';
import 'package:t_store/features/shop/screens/product_detail/widgets/product_attributes.dart';
import 'package:t_store/features/shop/screens/product_detail/widgets/product_detail_image_slider.dart';
import 'package:t_store/features/shop/screens/product_detail/widgets/product_meta_data.dart';
import 'package:t_store/features/shop/screens/product_detail/widgets/rating_share_widget.dart';
import 'package:t_store/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../commom/widgets/texts/section_heading.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key, required this.product}) : super(key: key);

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TProductImageSlider(),
            Padding(
                padding: const EdgeInsets.only(
                    right: TSizes.defaultSpace,
                    left: TSizes.defaultSpace,
                    bottom: TSizes.defaultSpace),
              child: Column(
                children: [

                  // Rating, share button
                  const TRatingAndShare(),

                  // Price Title, stock, brand
                  const TProductMetaData(),

                  // Attribute
                  const TProductAttributes(),
                  const SizedBox(height: TSizes.spaceBtwSections,),

                  // Checkout button
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(onPressed: () {}, child: Text('Checkout'))),
                  const SizedBox(height: TSizes.spaceBtwSections,),

                  // Description
                  const TSectionHeading(title: 'Description', showActionButton: false,),
                  const SizedBox(height: TSizes.spaceBtwItems,),
                  const ReadMoreText(
                    'Introducing our Classic White Oxford Shirt: a timeless essential crafted from premium cotton for ultimate comfort and breathability. With its tailored fit and button-down collar, this shirt exudes elegance and sophistication. Whether for a formal event or casual outing, its versatile white hue effortlessly complements any look. Elevate your wardrobe with this enduring piece that combines style and comfort seamlessly.',
                    trimLines: 2,
                    colorClickableText: Colors.pink,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Show less',
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  // Review
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems,),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(title: 'Review(199)', showActionButton: false,),
                      IconButton(onPressed: () => Get.to(() => const TProductReviewsScreen()), icon: const Icon(Iconsax.arrow_right_3, size: 18,)),
                    ],
                  ),

                  const SizedBox(height: TSizes.spaceBtwItems,),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:t_store/commom/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/commom/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:t_store/features/shop/controllers/product/product_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/features/shop/screens/product_detail/product_detail.dart';
import 'package:t_store/utils/constants/enums.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../styles/shadows.dart';
import '../../icons/t_brand_title_text_with_verified_icon.dart';
import '../../images/t_rounded_image.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';
import 'add_to_cart_button.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(
        productModel.price, productModel.salePrice);
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(
            product: productModel,
          )),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticleProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkGrey : TColors.white,
        ),
        child: Column(
          children: [
            // thumbnail, wishlist, discount

            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  Center(
                    child: TRoundedImage(
                      imageUrl: productModel.thumbnail,
                      applyImageRadius: true,
                    ),
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
                        "$salePercentage%",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.black),
                      ),
                    ),
                  ),

                  //icon heart
                  Positioned(
                    top: 0,
                    right: 0,
                    child: TFavouriteIcon(productId: productModel.id,)
                  )
                ],
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),

            // detail
            Padding(
              padding: EdgeInsets.only(left: TSizes.sm),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TProductTileText(
                      title: productModel.title,
                      smallSize: true,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems / 2,
                    ),
                    TBrandTitleWithVerifiedIcon(
                      title: productModel.brand!.name,
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            // price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    if (productModel.productType ==
                            ProductType.single.toString() &&
                        productModel.salePrice > 0)
                      Padding(
                        padding: const EdgeInsets.only(left: TSizes.sm),
                        child: Text(
                          productModel.price.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .apply(decoration: TextDecoration.lineThrough),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(left: TSizes.sm),
                      child: TProductPriceText(
                        price: controller.getProductPrice(productModel),
                      ),
                    ),
                  ]),
                ),

                ProductCartAddToCartButton(product: productModel,)
              ],
            )
          ],
        ),
      ),
    );
  }
}


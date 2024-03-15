import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/commom/widgets/icons/t_circular_icon.dart';
import 'package:t_store/features/shop/controllers/product/cart_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({Key? key, required this.product}) : super(key: key);
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace / 2),
      decoration: BoxDecoration(
          color: dark ? TColors.darkerGrey : TColors.light,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(TSizes.cardRadiusLg),
              topRight: Radius.circular(TSizes.cardRadiusLg))),
      child: Obx(
        ()=> Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                // minus
                TCircleIcon(
                  width: 40,
                  height: 40,
                  color: TColors.white,
                  icon: Iconsax.minus,
                  backgroundColor: TColors.darkerGrey,
                  onPressed: ()=> controller.productQuantityInCart.value < 1 ? null : controller.productQuantityInCart -=1,
                ),
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                Text(
                  controller.productQuantityInCart.value.toString(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                // Add
                TCircleIcon(
                  width: 40,
                  height: 40,
                  color: TColors.white,
                  icon: Iconsax.add,
                  backgroundColor: TColors.black,
                  onPressed: ()=> controller.productQuantityInCart +=1,
        
                ),
              ],
            ),
            ElevatedButton(onPressed: controller.productQuantityInCart.value < 1 ? null : ()=> controller.addToCart(product), style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: TColors.black,
              side: const BorderSide(color: TColors.black),
            ), child: const Text('Add to Cart'),)
          ],
        ),
      ),
    );
  }
}

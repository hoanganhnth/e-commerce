import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/shop/controllers/product/cart_controller.dart';

import '../../../../features/shop/screens/cart/cart.dart';
import '../../../../utils/constants/colors.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    super.key,
    required this.iconColor,
  });

  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    return Stack(children: [
      IconButton(
        onPressed: ()=> Get.to(() => const CartScreen()),
        icon: const Icon(Iconsax.shopping_bag),
        color: iconColor,
      ),
      Positioned(
        right: 0,
        child: Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: TColors.black,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
            child: Obx(
              ()=> Text(
                controller.noOfCartItem.value.toString(),
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: TColors.white, fontSizeFactor: 0.8),
              ),
            ),
          ),
        ),
      )
    ]);
  }
}

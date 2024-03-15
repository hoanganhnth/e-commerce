import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/controllers/product/cart_controller.dart';

import '../../../../../commom/widgets/products/cart/add_remove_button.dart';
import '../../../../../commom/widgets/products/cart/cart_item.dart';
import '../../../../../commom/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class TCardItems extends StatelessWidget {
  const TCardItems({
    super.key,
    required this.showAddRemoveButton,
  });

  final bool showAddRemoveButton;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return ListView.separated(
      itemCount: controller.cartItems.length,
      shrinkWrap: true,
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: TSizes.spaceBtwSections,
      ),
      itemBuilder: (BuildContext context, int index) => Obx(() {
        final item = controller.cartItems[index];
        return Column(
          children: [
            // cart item
            TCartItem(
              cartItem: item,
            ),
            if (showAddRemoveButton)
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

            // Add remove button
            if (showAddRemoveButton)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 70,
                      ),
                      TProductQuantityWithAddRemoveButton(
                        quantity: item.quantity,
                        add: () => controller.addOneToCart(item),
                        remove: () => controller.removeOneToCart(item),
                      ),
                    ],
                  ),
                  TProductPriceText(price: (item.price * item.quantity).toStringAsFixed(1))
                ],
              ),
          ],
        );
      }),
    );
  }
}

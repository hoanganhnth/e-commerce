import 'package:flutter/cupertino.dart';

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
    return ListView.separated(
      itemCount: 2,
      shrinkWrap: true,
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: TSizes.spaceBtwSections,
      ),
      itemBuilder: (BuildContext context, int index) => Column(
        children: [
          // cart item
          const TCartItem(),
          if (showAddRemoveButton)
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),

          // Add remove button
          if (showAddRemoveButton)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 70,
                    ),
                    TProductQuantityWithAddRemoveButton(),
                  ],
                ),
                TProductPriceText(price: '256')
              ],
            ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:t_store/commom/widgets/appbar/appbar.dart';

import 'package:t_store/commom/widgets/texts/product_price_text.dart';

import 'package:t_store/utils/constants/sizes.dart';

import '../../../../commom/widgets/products/cart/add_remove_button.dart';
import '../../../../commom/widgets/products/cart/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Cart'),
        showBackArrow: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: ListView.separated(
            itemCount: 10,
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            itemBuilder: (BuildContext context, int index) => Column(
              children: [
                // cart item
                const TCartItem(),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                // Add remove button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      const SizedBox(width: 70,),
                      TProductQuantityWithAddRemoveButton(),
                    ],),

                    TProductPriceText(price: '256')

                  ],
                ),

              ],
            ),
          )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: () {  }, child: const Text('Checkout \$256.0'),),
      ),

    );
  }
}



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/commom/widgets/appbar/appbar.dart';
import 'package:t_store/commom/widgets/loaders/animation_loader.dart';
import 'package:t_store/features/shop/controllers/product/cart_controller.dart';

import 'package:t_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:t_store/features/shop/screens/checkout/checkout.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/image_strings.dart';

import 'package:t_store/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Cart'),
        showBackArrow: true,
      ),
      body: Obx(() {
        final emptyWidget = TAnimationLoaderWidget(
            text: 'Whoops! Cart is Empty',
            animation: TImages.cartAnimation,
            showAction: true,
            actionText: 'Let\'s fill it',
            onActionPressed: () => Get.off(() => const NavigationMenu()));
        if (cartController.cartItems.isEmpty) {
          return emptyWidget;
        } else {
          return const SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(TSizes.defaultSpace),
                child: TCardItems(
                  showAddRemoveButton: true,
                )),
          );
        }
      }),
      bottomNavigationBar: cartController.cartItems.isEmpty
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: ElevatedButton(
                onPressed: () => Get.to(() => const CheckoutScreen()),
                child: Obx(() =>
                    Text('Checkout \$${cartController.totalCartPrice.value}')),
              ),
            ),
    );
  }
}

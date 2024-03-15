import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/commom/widgets/appbar/appbar.dart';
import 'package:t_store/commom/widgets/icons/t_circular_icon.dart';
import 'package:t_store/commom/widgets/layout/grid_layout.dart';
import 'package:t_store/commom/widgets/loaders/animation_loader.dart';
import 'package:t_store/commom/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/features/shop/controllers/product/favourite_controller.dart';
import 'package:t_store/features/shop/screens/home/home.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../utils/helpers/cloud_helper_functions.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = FavouriteController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        action: [
          TCircleIcon(
            icon: Iconsax.add,
            onPressed: () => Get.off(() => const NavigationMenu()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Obx(
              ()=> FutureBuilder(
              future: controller.favoriteProducts(),
              builder: (context, snapshot) {
                const loader = CircularProgressIndicator();
                final emptyWidget = TAnimationLoaderWidget(
                  text: 'Whoops! Wishlist is Empty...',
                  animation: TImages.pencilAnimation,
                  showAction: true,
                  actionText: 'Let\'s add some',
                  onActionPressed: () => Get.off(() => const NavigationMenu()),
                );
                final widget = TCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot, loader: loader ,nothingFound: emptyWidget);
                if (widget != null) return widget;
                final products = snapshot.data!;
                return TGridLayout(
                  itemCount: products.length,
                  itemBuilder: (p0, index) => TProductCardVertical(
                    productModel: products[index],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

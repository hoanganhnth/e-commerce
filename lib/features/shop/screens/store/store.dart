import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:t_store/commom/widgets/appbar/appbar.dart';
import 'package:t_store/commom/widgets/appbar/tabbar.dart';
import 'package:t_store/commom/widgets/custom_shapes/containers/search_container.dart';
import 'package:t_store/commom/widgets/layout/grid_layout.dart';
import 'package:t_store/commom/widgets/products/cart/cart_menu_icon.dart';
import 'package:t_store/commom/widgets/shimmers/brand_shimmer.dart';
import 'package:t_store/commom/widgets/texts/section_heading.dart';
import 'package:t_store/commom/widgets/brands/brand_card.dart';
import 'package:t_store/features/shop/controllers/brand_controller.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';
import 'package:t_store/features/shop/screens/brand/all_brands.dart';
import 'package:t_store/features/shop/screens/store/widgets/category_tab.dart';

import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/colors.dart';
import '../brand/brand_products.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final categories = CategoryController.instance.featuredCategories;
    final dark = THelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          action: [
            TCartCounterIcon(
              iconColor: dark ? TColors.white : TColors.black,
            )
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: THelperFunctions.isDarkMode(context)
                    ? TColors.dark
                    : TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      const TSearchContainer(
                        text: 'Search in store',
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      TSectionHeading(
                        title: 'Featured Brands',
                        onPressed: () => Get.to(() => const TAllBrandScreen()),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems / 1.5,
                      ),
                      Obx(() {
                        if (brandController.isLoading.value) {
                          return const TBrandShimmer();
                        }
                        if (brandController.featuredBrands.isEmpty) {
                          return Center(
                            child: Text(
                              'No Data Found',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .apply(color: TColors.white),
                            ),
                          );
                        }
                        return TGridLayout(
                          itemCount: brandController.featuredBrands.length,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            final brand = brandController.featuredBrands[index];
                            return TBrandCard(
                                showBorder: true,
                                brand: brand,
                                onTap: () =>
                                    Get.to(() => BrandProductScreen(brand: brand,)));
                          },
                        );
                      })
                    ],
                  ),
                ),
                // Tabs
                bottom: TTaBar(
                  tabs: categories
                      .map((category) => Tab(
                            child: Text(category.name),
                          ))
                      .toList(),
                ),
              )
            ];
          },
          body: TabBarView(
            children: categories.map((element) => TCategoryTab(category: categories.first,)).toList(),
          ),
        ),
      ),
    );
  }
}

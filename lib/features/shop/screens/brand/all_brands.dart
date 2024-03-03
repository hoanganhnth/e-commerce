import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:t_store/commom/widgets/appbar/appbar.dart';
import 'package:t_store/commom/widgets/brands/brand_card.dart';
import 'package:t_store/commom/widgets/layout/grid_layout.dart';
import 'package:t_store/commom/widgets/shimmers/brand_shimmer.dart';
import 'package:t_store/commom/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/controllers/brand_controller.dart';
import 'package:t_store/features/shop/models/brand_model.dart';
import 'package:t_store/features/shop/screens/brand/brand_products.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../utils/constants/colors.dart';

class TAllBrandScreen extends StatelessWidget {
  const TAllBrandScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Brand'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TSectionHeading(
                title: 'Brands',
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Obx(() {
                if (controller.isLoading.value) return TBrandShimmer();
                if (controller.featuredBrands.isEmpty) {
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
                  mainAxisExtent: 80,
                  itemCount: controller.allBrand.length,
                  itemBuilder: (_, index) {
                    final brand = controller.allBrand[index];
                    return TBrandCard(
                      brand: controller.allBrand[index],
                      showBorder: true,
                      onTap: () => Get.to(() => BrandProductScreen(brand: brand,)),
                    );
                  }

                );
              })
            ],
          ),
        ),
      ),
    );
  }
}

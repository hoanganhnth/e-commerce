import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:t_store/commom/widgets/layout/grid_layout.dart';
import 'package:t_store/commom/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/commom/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/features/shop/screens/all_products/all_products.dart';
import 'package:t_store/features/shop/screens/store/widgets/category_brand.dart';

import '../../../../../commom/widgets/brands/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/cloud_helper_functions.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              CategoryBrands(category: category),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              FutureBuilder(
                future: controller.getCategoryProducts(categoryId: category.id),
                builder: (context, snapshot) {
                  const loader = CircularProgressIndicator();
                  final widget = TCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot, loader: loader);
                  if (widget != null) return widget;
                  final products = snapshot.data!;
                  return Column(
                    children: [
                      TSectionHeading(
                        title: 'You might like',
                        onPressed: () => Get.to(() => TAllProducts(
                              title: 'Your might like',
                              futureMethod: controller.getCategoryProducts(
                                  categoryId: category.id, limit: -1),
                            )),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      TGridLayout(
                          itemCount: products.length,
                          itemBuilder: (_, index) => TProductCardVertical(
                                productModel: products[index],
                              ))
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}

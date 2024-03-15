import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:t_store/commom/widgets/appbar/appbar.dart';
import 'package:t_store/commom/widgets/images/t_rounded_image.dart';
import 'package:t_store/commom/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:t_store/commom/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/features/shop/screens/all_products/all_products.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../utils/helpers/cloud_helper_functions.dart';

class TSubCategoriesScreen extends StatelessWidget {
  const TSubCategoriesScreen({Key? key, required this.category})
      : super(key: key);

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text(category.name),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TRoundedImage(
                width: double.infinity,
                imageUrl: TImages.promoBanner3,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              FutureBuilder(
                future: controller.getSubCategory(category.id),
                builder: (context, snapshot) {
                  const loader = CircularProgressIndicator();
                  final widget = TCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot, loader: loader);
                  if (widget != null) return widget;
                  final subCategories = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: subCategories.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      final subCategory = subCategories[index];
                      return FutureBuilder(
                        future: controller.getCategoryProducts(categoryId: subCategory.id),
                        builder: (context, snapshot) {
                          const loader = CircularProgressIndicator();
                          final widget = TCloudHelperFunctions.checkMultiRecordState(
                              snapshot: snapshot, loader: loader);
                          if (widget != null) return widget;
                          final products = snapshot.data!;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TSectionHeading(
                                title: subCategory.name,
                                onPressed: () => Get.to(() => TAllProducts(
                                      title: subCategory.name,
                                      futureMethod:
                                          controller.getCategoryProducts(
                                              categoryId: subCategory.id,
                                              limit: -1),
                                    )),
                              ),
                              const SizedBox(
                                height: TSizes.spaceBtwItems / 2,
                              ),
                              SizedBox(
                                height: 120,
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: products.length,
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          TProductCardHorizontal(product: products[index],),
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          const SizedBox(
                                    width: TSizes.spaceBtwItems,
                                  ),
                                ),
                              ),
                              const SizedBox(height: TSizes.spaceBtwSections,),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/commom/widgets/shimmers/category_shimmer.dart';
import 'package:t_store/commom/widgets/sub_category/sub_categories.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';

import '../../../../../commom/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class THomeCategory extends StatelessWidget {
  const THomeCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Obx(() {
      if (controller.isLoading.value) return const TCategoryShimmer();
      if (controller.featuredCategories.isEmpty) {
        return Center(child: Text('No Data Found', style: Theme.of(context).textTheme.bodyMedium?.apply(color: Colors.white),),);
      }
      return SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            final category = controller.featuredCategories[index];
            return TVerticalImageText(
              isNetworkImage: false,
              image: category.image,
              title: category.name,
              onTap: () => Get.to(() => const TSubCategoriesScreen()),
              backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.dark : TColors.white,
            );
          },
        ),
      );
    });
  }
}

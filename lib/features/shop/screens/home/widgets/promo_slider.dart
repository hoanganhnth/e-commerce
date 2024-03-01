import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:t_store/commom/widgets/shimmers/shimmer.dart';
import 'package:t_store/features/shop/controllers/banner_controller.dart';
import 'package:t_store/features/shop/controllers/home_controller.dart';

import '../../../../../commom/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../commom/widgets/images/t_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(() {
      if (controller.isLoading.value) {
        return const TShimmerEffect(width: double.infinity, height: 190);
      }
      if (controller.banners.isEmpty) {
        return const Center(
          child: Text('No Data Found'),
        );
      } else {
        return Column(children: [
          CarouselSlider(
              items: controller.banners
                  .map((banner) => TRoundedImage(
                        imageUrl: banner.imageUrl,
                        onPressed: () => Get.toNamed(banner.targetScreen),
                // isNetworkImage: true,
                      ))
                  .toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                onPageChanged: (index, reason) =>
                    controller.updatePageIndicator(index),
              )),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < controller.banners.length; i++)
                  TCircularContainer(
                    width: 20,
                    height: 4,
                    backgroundColor: controller.carousalCurrentIndex.value == i
                        ? TColors.primary
                        : TColors.grey,
                    margin: EdgeInsets.only(right: 10),
                  ),
              ],
            ),
          )
        ]);
      }
    });
  }
}

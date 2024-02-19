import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:t_store/features/shop/controllers/home_controller.dart';

import '../../../../../commom/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../commom/widgets/images/t_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(children: [
      CarouselSlider(
          items: const [
            TRoundedImage(
              imageUrl: TImages.promoBanner1,
            ),
            TRoundedImage(
              imageUrl: TImages.promoBanner2,
            ),
            TRoundedImage(
              imageUrl: TImages.promoBanner3,
            ),
          ],
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
            for (int i = 0; i < 3; i++)
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
}

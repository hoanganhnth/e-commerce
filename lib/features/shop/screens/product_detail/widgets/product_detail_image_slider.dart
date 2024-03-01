import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/commom/widgets/appbar/appbar.dart';
import 'package:t_store/commom/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:t_store/commom/widgets/icons/t_circular_icon.dart';
import 'package:t_store/commom/widgets/images/t_rounded_image.dart';
import 'package:t_store/features/shop/controllers/product/image_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({Key? key, required this.product})
      : super(key: key);
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImageController());
    final images = controller.getAllProductImages(product);
    final dark = THelperFunctions.isDarkMode(context);
    return TCurvedEdgeWidget(
        widget: Container(
          color: dark ? TColors.darkerGrey : TColors.light,
          child: Stack(
            children: [
              // Main large image
              SizedBox(
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
                  child: Center(child: Obx(() {
                    final image = controller.selectedProductImage.value;
                    return GestureDetector(
                      onTap: () => controller.showEnlargedImage(image),
                      child: Image(
                        image: AssetImage(image),
                      ),
                    );
                    // return CachedNetworkImage(imageUrl: image,
                    //   progressIndicatorBuilder: (_, __, downloadProgress) =>
                    //       CircularProgressIndicator(value: downloadProgress
                    //           .progress, color: TColors.primary,),);
                  })),
                ),
              ),

              // App bar
              const TAppBar(
                showBackArrow: true,
                action: [
                  TCircleIcon(
                    icon: Iconsax.heart5,
                    color: Colors.red,
                  )
                ],
              ),

              // Image slider

              Positioned(
                right: 0,
                bottom: 30,
                left: TSizes.defaultSpace,
                child: SizedBox(
                  height: 80,
                  child: ListView.separated(
                    itemCount: images.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                      width: TSizes.spaceBtwItems,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Obx( () {
                        final imageSelected = controller.selectedProductImage.value == images[index];
                        return  TRoundedImage(
                          width: 80,
                          imageUrl: images[index],
                          padding: const EdgeInsets.all(TSizes.sm),
                          border: Border.all(color: imageSelected ? TColors.primary : Colors.transparent),
                          backgroundColor: dark ? TColors.dark : TColors.white,
                          onPressed: () => controller.selectedProductImage.value = images[index],
                        );
                      }

                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/commom/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/commom/widgets/texts/product_price_text.dart';
import 'package:t_store/commom/widgets/texts/product_title_text.dart';
import 'package:t_store/commom/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/controllers/product/product_controller.dart';
import 'package:t_store/features/shop/controllers/product/variation_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../../commom/widgets/chips/choice_chip.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({Key? key, required this.product}) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final dark = THelperFunctions.isDarkMode(context);
    return Obx(
        ()=> Column(
        children: [
          if (controller.selectedVariation.value.id.isNotEmpty)
            // Selected attributes pricing & description
            TRoundedContainer(
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
              child: Column(
                children: [
                  // Title price & stock status
                  Row(
                    children: [
                      const TSectionHeading(
                        title: 'Variation',
                        showActionButton: false,
                      ),
                      const SizedBox(
                        width: TSizes.spaceBtwItems,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const TProductTileText(title: 'Price:'),
                              const SizedBox(
                                width: TSizes.spaceBtwItems,
                              ),

                              // Actual Price
                              if (controller.selectedVariation.value.salePrice > 0)
                                Text(
                                  '\$${controller.getVariationPrice()}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.apply(
                                          decoration: TextDecoration.lineThrough),
                                ),
                              if (controller.selectedVariation.value.salePrice > 0)
                                const SizedBox(
                                  width: TSizes.spaceBtwItems,
                                ),

                              // sale price
                              TProductPriceText(price: controller.getVariationPrice())
                            ],
                          ),
                          // stock
                          Row(
                            children: [
                              const TProductTileText(title: 'Stock: '),
                              Text(
                                controller.variationStockStatus.value,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  // Variation Description
                  const TProductTileText(
                      maxLine: 4,
                      smallSize: true,
                      title:
                          'This is the Description the Product and it can go up to max 4 lines')
                ],
              ),
            ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),

          // Attributes

          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: product.productAttributes!
                  .map((attribute) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TSectionHeading(
                            title: attribute.name ?? '',
                            showActionButton: false,
                          ),
                          const SizedBox(
                            height: TSizes.spaceBtwItems / 2,
                          ),
                          Obx(
                            ()=> Wrap(
                                spacing: 8,
                                children: attribute.values!.map((value) {
                                  final isSelected = controller
                                          .selectedAttributes[attribute.name] ==
                                      value;
                                  final available = controller
                                      .getAttributesAvailabilityInVariation(
                                          product.productVariations!,
                                          attribute.name!)
                                      .contains(value);
                                  return TChoiceChip(
                                      text: value,
                                      selected: isSelected,
                                      onSelected: available
                                          ? (selected) {
                                        if (selected && available) {
                                          controller.onAttributeSelected(
                                              product,
                                              attribute.name ?? '',
                                              value);
                                        }
                                      }
                                          : null);
                                }).toList()),
                          )
                        ],
                      ))
                  .toList())
        ],
      ),
    );
  }
}

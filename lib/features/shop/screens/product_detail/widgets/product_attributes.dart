import 'package:flutter/material.dart';
import 'package:t_store/commom/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/commom/widgets/texts/product_price_text.dart';
import 'package:t_store/commom/widgets/texts/product_title_text.dart';
import 'package:t_store/commom/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../../commom/widgets/chips/choice_chip.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
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
                          Text(
                            '\$25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(
                            width: TSizes.spaceBtwItems,
                          ),

                          // sale price
                          const TProductPriceText(price: '20')
                        ],
                      ),
                      // stock
                      Row(
                        children: [
                          const TProductTileText(title: 'Stock: '),
                          Text(
                            'In stock',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.apply(decoration: TextDecoration.lineThrough),
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
        const SizedBox(height:TSizes.spaceBtwItems,),

        // Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(
              title: 'Color',
              showActionButton: false,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: 'Green', selected: true, onSelected: (value){},),
                TChoiceChip(text: 'Blue', selected: false, onSelected: (value){},),
                TChoiceChip(text: 'Yellow', selected: false, onSelected: (value){},),
              ],
            )

          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(
              title: 'Size',
              showActionButton: false,
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: 'EU 34', selected: true, onSelected: (value){},),
                TChoiceChip(text: 'EU 36', selected: false, onSelected: (value){},),
                TChoiceChip(text: 'EU 38', selected: false, onSelected: (value){},),
              ],
            )

          ],
        ),
      ],
    );
  }
}


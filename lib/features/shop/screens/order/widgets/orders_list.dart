import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../../commom/widgets/custom_shapes/containers/rounded_container.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),

      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (_, index) => TRoundedContainer(
          backgroundColor: dark ? TColors.dark : TColors.light,
          padding: const EdgeInsets.only(
              top: TSizes.md,
              left: TSizes.md,
              bottom: TSizes.md,
              right: TSizes.lg),
          showBorder: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Row1
              Row(
                children: [
                  const Icon(Iconsax.ship),
                  const SizedBox(
                    width: TSizes.spaceBtwItems / 2,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Progressing',
                          style: Theme.of(context).textTheme.bodyLarge?.apply(
                              color: TColors.primary, fontWeightDelta: 1),
                        ),
                        Text(
                          '01 Sep 2024',
                          style: Theme.of(context).textTheme.headlineSmall,
                        )
                      ],
                    ),
                  ),
                  Icon(
                    Iconsax.arrow_right_34,
                    size: TSizes.iconSm,
                  )
                ],
              ),

              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Row(
                children: [
                  // Row2
                  Flexible(
                    child: Row(
                      children: [
                        const Icon(Iconsax.ship),
                        const SizedBox(
                          width: TSizes.spaceBtwItems / 2,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Order',
                                  style:
                                      Theme.of(context).textTheme.labelMedium),
                              Text(
                                'CWT0013',
                                style: Theme.of(context).textTheme.titleMedium,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Row3
                  Flexible(
                    child: Row(
                      children: [
                        const Icon(Iconsax.calendar),
                        const SizedBox(
                          width: TSizes.spaceBtwItems / 2,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Shipping Date',
                                  style:
                                      Theme.of(context).textTheme.labelMedium),
                              Text(
                                '09 Sep 2024',
                                style: Theme.of(context).textTheme.titleMedium,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          height: TSizes.spaceBtwItems ,
        ),
        itemCount: 7,
      ),
    );
  }
}

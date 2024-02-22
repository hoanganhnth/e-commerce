import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icons/t_circular_icon.dart';

class TProductQuantityWithAddRemoveButton extends StatelessWidget {
  const TProductQuantityWithAddRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      TCircleIcon(
        icon: Iconsax.minus,
        width: 32,
        height: 32,
        size: TSizes.md,
        color: THelperFunctions.isDarkMode(context)
            ? TColors.white
            : TColors.black,
        backgroundColor:  THelperFunctions.isDarkMode(context)
            ? TColors.darkGrey
            : TColors.light,
      ),
      const SizedBox(width: TSizes.spaceBtwItems,),
      Text('2', style: Theme.of(context).textTheme.titleSmall,),                      const SizedBox(width: TSizes.spaceBtwItems,),
      TCircleIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: TColors.white,
          backgroundColor:  TColors.primary
      ),
    ],);
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/models/address_model.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../../commom/widgets/custom_shapes/containers/rounded_container.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({
    super.key,
    required this.selectedAddress, required this.address, this.onPressed,
  });

  final bool selectedAddress;
  final AddressModel address;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return InkWell(
      onTap: onPressed,
      child: TRoundedContainer(
        width: double.infinity,
        showBorder: true,
        backgroundColor: selectedAddress
            ? TColors.primary.withOpacity(0.5)
            : Colors.transparent,
        borderColor: selectedAddress ? Colors.transparent : TColors.dark,
        margin: const EdgeInsets.only(
          bottom: TSizes.spaceBtwItems,
        ),
        padding: const EdgeInsets.all(TSizes.md),
        child: Stack(
          children: [
            // Icon selected
            Positioned(
              top: 0,
              right: 5,
              child: Icon(selectedAddress ? Iconsax.tick_circle5 : null,
                  color: selectedAddress
                      ? dark
                          ? TColors.light
                          : TColors.dark
                      : null),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  address.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems / 2,
                ),
                Text(
                  address.phoneNumber,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems / 2,
                ),
                Text(
                  address.toString(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems / 2,
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            'Subtotal',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            '\$1613',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ]),
        const SizedBox(height: TSizes.spaceBtwItems / 2,),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            'Shipping fee',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            '\$15',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ]),
        const SizedBox(height: TSizes.spaceBtwItems / 2,),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            'Tax Fee',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            '\$150',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ]),
        const SizedBox(height: TSizes.spaceBtwItems ,),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            'Order total',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            '\$2000',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ]),
        const SizedBox(height: TSizes.spaceBtwItems / 2,),
      ],
    );
  }
}

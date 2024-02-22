import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:t_store/commom/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/colors.dart';

import '../../../../../utils/constants/sizes.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      TSectionHeading(
        title: 'Shipping address',
        buttonTitle: 'Change',
        onPressed: () {},
      ),
      Text(
        'HoangAnh',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      const SizedBox(
        height: TSizes.spaceBtwItems / 2,
      ),
      Row(
        children: [
          const Icon(
            Icons.phone,
            color: TColors.grey,
            size: 16,
          ),
          const SizedBox(
            width: TSizes.spaceBtwItems,
          ),
          Text(
            '+84 357660780',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
      const SizedBox(
        height: TSizes.spaceBtwItems / 2,
      ),
      Row(
        children: [
          const Icon(
            Icons.location_history,
            color: TColors.grey,
            size: 16,
          ),
          const SizedBox(
            width: TSizes.spaceBtwItems,
          ),
          Expanded(
            child: Text(
              '255 Cau Giay, Dich Vong, Ha Noi, Viet Nam',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium,
              softWrap: true,
            ),
          ),
        ],
      )
    ]);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:t_store/commom/widgets/layout/grid_layout.dart';
import 'package:t_store/commom/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/commom/widgets/texts/section_heading.dart';

import '../../../../../commom/widgets/brands/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TBrandShowcase(
                images: [
                  TImages.productImage3,
                  TImages.productImage2,
                  TImages.productImage1
                ],
              ),
              TSectionHeading(title: 'You might like'),
              const SizedBox(height: TSizes.spaceBtwItems,),
              TGridLayout(itemCount: 4, itemBuilder: (BuildContext , int ) => const TProductCardVertical(), )
            ],
          ),
        ),
      ],
    );
  }
}

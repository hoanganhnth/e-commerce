import 'package:flutter/material.dart';
import 'package:t_store/commom/widgets/layout/grid_layout.dart';
import 'package:t_store/commom/widgets/shimmers/shimmer.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TVerticalProductShimmer extends StatelessWidget {
  const TVerticalProductShimmer({Key? key, this.itemCount = 4}) : super(key: key);

  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return TGridLayout(itemCount: itemCount, itemBuilder: (_,__) =>
        const SizedBox(
          width: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TShimmerEffect(width: 180, height: 180),
              SizedBox(height: TSizes.spaceBtwItems,),
              
              TShimmerEffect(width: 160, height: 15),
              SizedBox(height: TSizes.spaceBtwItems / 2,),
              TShimmerEffect(width: 110, height: 15),
            ],
          ),
        )
    );
  }
}

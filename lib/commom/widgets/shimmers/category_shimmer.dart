import 'package:flutter/material.dart';
import 'package:t_store/commom/widgets/shimmers/shimmer.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TCategoryShimmer extends StatelessWidget {
  const TCategoryShimmer({Key? key, this.itemCount = 6}) : super(key: key);

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(width: TSizes.spaceBtwItems,),
          itemCount: itemCount,
          itemBuilder: (BuildContext context, int index) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TShimmerEffect(width: 55, height: 55, radius: 55,),
                SizedBox(height: TSizes.spaceBtwItems / 2),
                
                TShimmerEffect(width: 55, height: 8),
              ],
            );
          }
      ),
    );
  }
}

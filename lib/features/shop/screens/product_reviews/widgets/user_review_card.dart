import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:t_store/commom/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/commom/widgets/products/ratings/rating_indicator.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TUserReviewCard extends StatelessWidget {
  const TUserReviewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        // Profile Image
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage(TImages.userProfileImage1),
              ),
              const SizedBox(
                width: TSizes.spaceBtwItems,
              ),
              Text(
                'Hoang Anh',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ]),

        // Review
        Row(
          children: [
            TRatingBarIndicator(
              rating: 3.5,
              small: true,
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              '01-Nov-2024',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),

        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        // Read more
        ReadMoreText(
          'Love the shirt! It is incredibly comfy and fits just right. The attention to detail is impressive, and the color options are great. Highly recommend',
          trimLength: 1,
          trimExpandedText: ' show less',
          trimCollapsedText: ' show more',
          trimMode: TrimMode.Line,
          moreStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
          lessStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
        ),

        const SizedBox(height: TSizes.spaceBtwItems,),
        // Company Review
        TRoundedContainer(
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Padding(
            padding: EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('TStore', style: Theme.of(context).textTheme.bodyLarge,),
                    Text('21-Nov-2024', style: Theme.of(context).textTheme.bodyLarge,),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwItems,),
                const ReadMoreText(
                  "Couldn't agree more! This shirt is a game-changer. The comfort and fit are unmatched, and the craftsmanship speaks for itself. With such a wide range of colors, there's something for everyone. Definitely a must-have in any wardrobe",
                  trimLength: 1,
                  trimExpandedText: ' show less',
                  trimCollapsedText: ' show more',
                  trimMode: TrimMode.Line,
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColors.primary),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections,)
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

import 'package:t_store/commom/widgets/appbar/appbar.dart';
import 'package:t_store/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:t_store/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../commom/widgets/products/ratings/rating_indicator.dart';

class TProductReviewsScreen extends StatelessWidget {
  const TProductReviewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text(
          'Review & Rating',
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Rating and reviews are verified and are from people who use the same of device that you are'),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Overall Product Rating
              TOverallProductRating(),
              TRatingBarIndicator(rating: 3.5,),
              Text('12.611', style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height: TSizes.spaceBtwSections,),
              TUserReviewCard(),
              TUserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}

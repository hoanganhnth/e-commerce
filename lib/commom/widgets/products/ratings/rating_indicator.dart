
import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';

class TRatingBarIndicator extends StatelessWidget {
  const TRatingBarIndicator({
    super.key, required this.rating, this.small = false,
  });
  final bool small;

  final double rating;
  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemSize: small ? 15 : 20,
      unratedColor: TColors.grey,
      itemBuilder: (BuildContext context, int index) => const Icon(
        Iconsax.star1,
        color: TColors.primary,
      ),
    );
  }
}

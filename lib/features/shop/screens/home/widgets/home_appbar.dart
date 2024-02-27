import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:t_store/commom/widgets/loaders/shimmer.dart';

import '../../../../../commom/widgets/appbar/appbar.dart';
import '../../../../../commom/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../personalization/controllers/user_controller.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: TColors.grey),
          ),
          Obx(() {
            if (controller.profileLoading.value) {
              return const TShimmerEffect(width: 80, height: 15);
            }
            return Text(controller.user.value.fullName,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: TColors.white));
          })
        ],
      ),
      action: [
        TCartCounterIcon(
          iconColor: TColors.white,
        )
      ],
    );
  }
}

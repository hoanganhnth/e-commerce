import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/commom/widgets/appbar/appbar.dart';
import 'package:t_store/commom/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:t_store/commom/widgets/list_tiles/setting_menu_tile.dart';
import 'package:t_store/commom/widgets/texts/section_heading.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/personalization/screens/address/address.dart';
import 'package:t_store/features/personalization/screens/profile/profile.dart';
import 'package:t_store/features/shop/screens/cart/cart.dart';
import 'package:t_store/features/shop/screens/order/order.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../commom/widgets/list_tiles/user_profile_tile.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          // header
          TPrimaryHeaderContainer(
            child: Column(
              children: [
                TAppBar(
                  title: Text(
                    'Account',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.apply(color: TColors.white),
                  ),
                ),

                // User profile
                TUserProfileTile(onPressed: () => Get.to(() => const ProfileScreen()),),
                const SizedBox(height: TSizes.spaceBtwSections),
              ],
            ),
          ),

          // account setting
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                const TSectionHeading(
                  title: 'Account Setting',
                  showActionButton: false,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                TSettingProfileTile(
                    title: 'My Addresses',
                    subTitle: 'Set shopping delivery address',
                    icon: Iconsax.safe_home, onTap: () => Get.to(() => UserAddressScreen()),),
                TSettingProfileTile(
                    title: 'My Cart',
                    subTitle: 'Add, remove products and move to checkout',
                    icon: Iconsax.shopping_cart,
                    onTap: () => Get.to(() => const CartScreen())),
                TSettingProfileTile(
                    title: 'My Orders',
                    subTitle: 'In-progress and Completed Orders',
                    icon: Iconsax.bag_tick,
                    onTap: () => Get.to(() => const OrderScreen())),
                const TSettingProfileTile(
                    title: 'Bank Account',
                    subTitle: 'Withdraw balance to registered bank account',
                    icon: Iconsax.bank),
                const TSettingProfileTile(
                    title: 'My Coupons',
                    subTitle: 'List of all the discounted coupons',
                    icon: Iconsax.discount_shape),
                const TSettingProfileTile(
                    title: 'Notifications',
                    subTitle: 'Set and kind of notifications message',
                    icon: Iconsax.notification),
                const TSettingProfileTile(
                    title: 'Account Privacy',
                    subTitle: 'Manage data usage and connected accounts',
                    icon: Iconsax.security_card),

                // App setting
                const SizedBox(height: TSizes.spaceBtwSections),
                const TSectionHeading(
                  title: 'App Settings',
                  showActionButton: false,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                const TSettingProfileTile(
                    title: 'Load data',
                    subTitle: 'Upload data to your cloud firebase',
                    icon: Iconsax.document_upload),
                TSettingProfileTile(
                  title: 'Geolocation',
                  subTitle: 'Set recommendation based on location',
                  icon: Iconsax.location,
                  trailing: Switch(value: true, onChanged: (value) {}),
                ),
                TSettingProfileTile(
                  title: 'Safe Mode',
                  subTitle: 'Search result is safe for all ages',
                  icon: Iconsax.security_user,
                  trailing: Switch(value: true, onChanged: (value) {}),
                ),
                TSettingProfileTile(
                  title: 'HD Image quality',
                  subTitle: 'Set image quality to be seen',
                  icon: Iconsax.image,
                  trailing: Switch(value: true, onChanged: (value) {}),
                ),

                const SizedBox(height: TSizes.spaceBtwSections,),

                // Logout

                SizedBox(width: double.infinity,
                child: OutlinedButton(onPressed: () => AuthenticationRepository.instance.logout(), child: const Text('Logout'),),)

              ],
            ),
          )
        ]),
      ),
    );
  }
}

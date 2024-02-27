import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/commom/widgets/appbar/appbar.dart';
import 'package:t_store/commom/widgets/images/t_circular_image.dart';
import 'package:t_store/commom/widgets/loaders/shimmer.dart';
import 'package:t_store/commom/widgets/texts/section_heading.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/change_phone_number.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Profile image
              SizedBox(
                width: double.infinity,
                child: Center(
                  child: Column(
                    children: [
                      Obx(() {
                        final networkImage =
                            controller.user.value.profilePicture;
                        final image = networkImage.isNotEmpty
                            ? networkImage
                            : TImages.user;
                        return controller.imageUploading.value
                            ? const TShimmerEffect(
                                width: 80,
                                height: 80,
                                radius: 80,
                              )
                            : TCircularImage(
                                image: image,
                                isNetworkImage: networkImage.isNotEmpty,
                                width: 80,
                                height: 80,
                                padding: 0,
                              );
                      }),
                      TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(),
                        child: const Text('Change your profile'),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),

              // Profile information
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Column(
                children: [
                  const TSectionHeading(
                    title: 'Profile Information',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  Obx(
                    () => TProfileMenu(
                      title: 'Name',
                      value: controller.user.value.fullName,
                      onPressed: () => Get.to(() => const ChangeNameScreen()),
                    ),
                  ),
                  Obx(
                    () => TProfileMenu(
                      title: 'Username',
                      value: controller.user.value.userName,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),

              // Personal information
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Column(
                children: [
                  const TSectionHeading(
                    title: 'Personal Information',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  TProfileMenu(
                    title: 'UserId',
                    value: controller.user.value.id,
                    icon: Iconsax.copy,
                  ),
                  TProfileMenu(
                    title: 'Email',
                    value: controller.user.value.email,
                  ),
                  Obx(
                    () => TProfileMenu(
                      title: 'Phone Number',
                      value: controller.user.value.phoneNumber,
                      onPressed: () =>
                          Get.to(() => const ChangePhoneNumberScreen()),
                    ),
                  ),
                  const TProfileMenu(
                    title: 'Gender',
                    value: 'Male',
                  ),
                  const TProfileMenu(
                    title: 'Date of birth',
                    value: '18 Mar, 2003',
                  ),
                ],
              ),

              // Personal information
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text(
                    'Close Account',
                    style: TextStyle(color: Colors.red),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

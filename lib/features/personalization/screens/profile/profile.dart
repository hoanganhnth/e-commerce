import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/commom/widgets/appbar/appbar.dart';
import 'package:t_store/commom/widgets/images/t_circular_image.dart';
import 'package:t_store/commom/widgets/texts/section_heading.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Profile image
              SizedBox(
                width: double.infinity,
                child: Center(
                  child: Column(
                    children: [
                      const TCircularImage(
                        image: TImages.user,
                        width: 80,
                        height: 80,
                        padding: 0,
                      ),
                      TextButton(
                        onPressed: () {},
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
              const Column(
                children: [
                  TSectionHeading(
                    title: 'Profile Information',
                    showActionButton: false,
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  TProfileMenu(
                    title: 'Name',
                    value: 'Hoang Anh',
                  ),
                  TProfileMenu(
                    title: 'Username',
                    value: 'anh_nth',
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
              const Column(
                children: [
                  TSectionHeading(
                    title: 'Personal Information',
                    showActionButton: false,
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  TProfileMenu(
                    title: 'UserId',
                    value: '1832003',
                    icon: Iconsax.copy,
                  ),
                  TProfileMenu(
                    title: 'Email',
                    value: 'hoanganhnth2k3@gmail.com',
                  ),
                  TProfileMenu(
                    title: 'Phone Number',
                    value: '0357660780',
                  ),
                  TProfileMenu(
                    title: 'Gender',
                    value: 'Male',
                  ),
                  TProfileMenu(
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
              TextButton(onPressed: () {}, child: const Text(
                'Close Account', style: TextStyle(color: Colors.red),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

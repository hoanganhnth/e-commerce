import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/commom/widgets/appbar/appbar.dart';
import 'package:t_store/commom/widgets/brands/brand_card.dart';
import 'package:t_store/commom/widgets/layout/grid_layout.dart';
import 'package:t_store/commom/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/screens/brand/brand_products.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TAllBrandScreen extends StatelessWidget {
  const TAllBrandScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Brand'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TSectionHeading(
                title: 'Brands',
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TGridLayout(
                mainAxisExtent: 80,
                itemCount: 7,
                itemBuilder: (BuildContext, int) =>
                    TBrandCard(showBorder: true,onTap: () => Get.to(() => const BrandProductScreen()),),
              )
            ],
          ),
        ),
      ),
    );
  }
}

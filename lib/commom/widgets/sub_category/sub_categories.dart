import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:t_store/commom/widgets/appbar/appbar.dart';
import 'package:t_store/commom/widgets/images/t_rounded_image.dart';
import 'package:t_store/commom/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:t_store/commom/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TSubCategoriesScreen extends StatelessWidget {
  const TSubCategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Sports Shirts'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TRoundedImage(
                width: double.infinity, imageUrl: TImages.promoBanner3,),
              const SizedBox(height: TSizes.spaceBtwItems,),

              Column(
                children: [
                  TSectionHeading(
                    title: 'Sports Equipments', onPressed: () {},),
                  const SizedBox(height: TSizes.spaceBtwItems / 2,),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) =>  const TProductCardHorizontal(),
                      separatorBuilder: (BuildContext context, int index) => const SizedBox(width: TSizes.spaceBtwItems,),),
                  )

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

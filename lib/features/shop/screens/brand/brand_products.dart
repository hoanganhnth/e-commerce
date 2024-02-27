import 'package:flutter/material.dart';
import 'package:t_store/commom/widgets/appbar/appbar.dart';
import 'package:t_store/commom/widgets/brands/brand_card.dart';
import 'package:t_store/commom/widgets/products/sortable/sortable_products.dart';
import 'package:t_store/utils/constants/sizes.dart';

class BrandProductScreen extends StatelessWidget {
  const BrandProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(
        title: Text('Nike'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TBrandCard(showBorder: true),
              SizedBox(height: TSizes.spaceBtwSections,),

              TSortableProducts()

            ],
          ),
        ),
      ),
    );
  }
}

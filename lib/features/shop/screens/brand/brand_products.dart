import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:t_store/commom/widgets/appbar/appbar.dart';
import 'package:t_store/commom/widgets/brands/brand_card.dart';
import 'package:t_store/commom/widgets/products/sortable/sortable_products.dart';
import 'package:t_store/commom/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:t_store/features/shop/controllers/brand_controller.dart';
import 'package:t_store/features/shop/models/brand_model.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_functions.dart';

class BrandProductScreen extends StatelessWidget {
  const BrandProductScreen({Key? key, required this.brand}) : super(key: key);

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text(brand.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TBrandCard(
                showBorder: true,
                brand: brand,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              FutureBuilder(
                future: controller.getBrandProducts(brandId: brand.id),
                builder:
                    (context,  snapshot) {
                  const loader = TVerticalProductShimmer();
                  final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                  if (widget != null) return widget;
                  final brandProducts = snapshot.data!;
                  return TSortableProducts(products: brandProducts);
                    },
              )
            ],
          ),
        ),
      ),
    );
  }
}

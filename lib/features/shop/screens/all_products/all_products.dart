import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/commom/widgets/appbar/appbar.dart';
import 'package:t_store/commom/widgets/layout/grid_layout.dart';
import 'package:t_store/commom/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/commom/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:t_store/features/shop/controllers/product/all_products_controller.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_functions.dart';

import '../../../../commom/widgets/products/sortable/sortable_products.dart';
import '../../models/product_model.dart';

class TAllProducts extends StatelessWidget {
  const TAllProducts(
      {Key? key, required this.title, this.query, this.futureMethod})
      : super(key: key);

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    return Scaffold(
      appBar: TAppBar(
        title: Text(title),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: FutureBuilder(future: futureMethod ?? controller.fetchProductByQuery(query ),
          builder: (context,snapshot) {
            const loader = TVerticalProductShimmer();
            final widget = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
            if (widget != null) return widget;
            final products = snapshot.data!;
            return TSortableProducts(products: products,); },
          ),
        ),
      ),
    );
  }
}

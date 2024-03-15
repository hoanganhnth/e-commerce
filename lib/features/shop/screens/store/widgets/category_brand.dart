import 'package:flutter/material.dart';
import 'package:t_store/commom/widgets/brands/brand_show_case.dart';
import 'package:t_store/features/shop/controllers/brand_controller.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/cloud_helper_functions.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({Key? key, required this.category}) : super(key: key);

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
      future: controller.getBrandForCategory(category.id),
      builder: (context, snapshot) {
        const loader = CircularProgressIndicator();
        final widget = TCloudHelperFunctions.checkMultiRecordState(
            snapshot: snapshot, loader: loader);
        if (widget != null) return widget;
        final brands = snapshot.data!;
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: brands.length,
          itemBuilder: (BuildContext context, int index) {
            final brand = brands[index];
            return FutureBuilder(
              future: controller.getBrandProducts(brandId: brand.id, limit: 3),
              builder: (context, snapshot) {
                const loader = CircularProgressIndicator();
                final widget = TCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot, loader: loader);
                if (widget != null) return widget;
                final products = snapshot.data!;
                return TBrandShowcase(
                    brand: brand,
                    images: products.map((e) => e.thumbnail).toList());
              },
            );
          },
        );
      },
    );
  }
}

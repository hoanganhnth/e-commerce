import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:t_store/commom/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:t_store/commom/widgets/icons/t_brand_title_text_with_verified_icon.dart';
import 'package:t_store/commom/widgets/images/t_circular_image.dart';
import 'package:t_store/commom/widgets/texts/product_price_text.dart';
import 'package:t_store/commom/widgets/texts/product_title_text.dart';
import 'package:t_store/features/shop/controllers/product/product_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({Key? key, required this.product}) : super(key: key);

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Price
        Row(
          children: [
            // sale
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text(
                '$salePercentage%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: TColors.black),
              ),
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            if (product.productType == ProductType.single.toString() && product.salePrice > 0)
              Text(
                '\$${product.price}',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough),
              ),

            if (product.productType == ProductType.single.toString() && product.salePrice > 0)
              const SizedBox(
                width: TSizes.spaceBtwItems,
              ),


            TProductPriceText(
              price: controller.getProductPrice(product),
              isLarge: true,
            )
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),
        // Title
        TProductTileText(title: product.title),
        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),

        // Stock status
        Row(
          children: [
            const TProductTileText(title: 'Status:'),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              controller.getProductStockStatus(product.stock),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),

        // brand
        Row(
          children: [
            TCircularImage(
              width: 32,
              height: 32,
              image: product.brand != null ? product.brand!.image : '',
              overlayColor: dark ? TColors.white : TColors.black,
            ),
            TBrandTitleWithVerifiedIcon(
              title: product.brand != null ? product.brand!.name : '',
              brandTextSize: TextSizes.medium,
            )
          ],
        ),
      ],
    );
  }
}

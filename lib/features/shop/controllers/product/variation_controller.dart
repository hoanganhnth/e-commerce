import 'package:get/get.dart';
import 'package:t_store/features/shop/controllers/product/cart_controller.dart';
import 'package:t_store/features/shop/controllers/product/image_controller.dart';
import 'package:t_store/features/shop/models/product_model.dart';

import '../../models/product_variation_model.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();


  RxString variationStockStatus = ''.obs;
  RxMap selectedAttributes = {}.obs;
  Rx<ProductVariationModel> selectedVariation =
      ProductVariationModel.empty().obs;

  void onAttributeSelected(
      ProductModel product, attributeName, attributeValue) {
    final selectedAttributes =
        Map<String, dynamic>.from(this.selectedAttributes);
    selectedAttributes[attributeName] = attributeValue;
    this.selectedAttributes[attributeName] = attributeValue;

    final selectedVariation = product.productVariations!.firstWhere(
        (element) =>
            _isSameAttributeValues(element.attributeValues, selectedAttributes),
        orElse: () => ProductVariationModel.empty());
    if (selectedVariation.image.isNotEmpty) {
      ImageController.instance.selectedProductImage.value =
          selectedVariation.image;
    }
    if (selectedVariation.id.isNotEmpty) {
      final cartController = CartController.instance;
      cartController.productQuantityInCart.value = cartController.getVariationQuantityInCart(product.id, selectedVariation.id);
    }
    this.selectedVariation.value = selectedVariation;
    getProductVariationStockStatus();
  }

  bool _isSameAttributeValues(
    Map<String, dynamic> variationAttributes,
    Map<String, dynamic> selectedAttribute,
  ) {
    if (variationAttributes.length != selectedAttribute.length) return false;
    for (final key in variationAttributes.keys) {
      if (variationAttributes[key] != selectedAttribute[key]) return false;
    }
    return true;
  }

  Set<String?> getAttributesAvailabilityInVariation(
      List<ProductVariationModel> variations, String attributeName) {
    final availableVariationAttributeValues = variations
        .where((element) =>
            element.attributeValues[attributeName] != null &&
            element.attributeValues[attributeName]!.isNotEmpty &&
            element.stock > 0)
    .map((variation) => variation.attributeValues[attributeName])
        .toSet();
    return availableVariationAttributeValues;
  }

  String getVariationPrice() {
    return (selectedVariation.value.salePrice > 0 ? selectedVariation.value.salePrice : selectedVariation.value.price).toString();
  }

  void getProductVariationStockStatus() {
    variationStockStatus.value =
        selectedVariation.value.stock > 0 ? 'In stock' : 'Out of Stock';
  }

  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }
}

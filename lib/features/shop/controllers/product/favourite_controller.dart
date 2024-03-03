import 'dart:convert';

import 'package:get/get.dart';
import 'package:t_store/commom/widgets/loaders/loaders.dart';
import 'package:t_store/data/repositories/products/product_repository.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/local_storage/storage_utility.dart';

class FavouriteController extends GetxController {
  static FavouriteController get instance => Get.find();

  final favourites = <String, bool>{}.obs;
  

  @override
  void onInit() {
    super.onInit();
    initFavourite();
  }

  Future<void> initFavourite() async{
    final json = TLocalStorage.instance().readData('favorites');

    if (json != null) {
      final storedFavorites = jsonDecode(json) as Map<String, dynamic>;
      favourites.assignAll(storedFavorites.map((key, value) =>  MapEntry(key, value as bool)));
    }
  }

  bool isFavorite(String productId) {
    return favourites[productId] ?? false;
  }

  void toggleFavoriteProduct(String productId) {
    if (!favourites.containsKey(productId)) {
      favourites[productId] = true;
      saveFavoriteToStorage();
      TLoaders.customToast(message: 'Product has been added to the Wishlist.');
    } else {
      TLocalStorage.instance().removeData(productId);
      favourites.remove(productId);
      saveFavoriteToStorage();
      favourites.refresh();
      TLoaders.customToast(message: 'Product has been removed to the Wishlist.');

    }
  }

  void saveFavoriteToStorage() {
    final encodedFavorite = json.encode(favourites);
    TLocalStorage.instance().saveData('favorites', encodedFavorite);
  }

  Future<List<ProductModel>> favoriteProducts()async {
    return await ProductRepository.instance.getFavoriteProduct(favourites.keys.toList());
  }
}
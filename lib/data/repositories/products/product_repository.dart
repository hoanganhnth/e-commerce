import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/dummy/dummy_data.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;


  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db.collection('products').where('IsFeatured', isEqualTo: true).limit(4).get();

      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch(e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final snapshot = await _db.collection('products').where('IsFeatured', isEqualTo: true).get();

      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch(e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnap = await query.get();
      final List<ProductModel> productList = querySnap.docs.map((doc) => ProductModel.fromQuerySnapshot(doc)).toList();
      return productList;
    } on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch(e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<List<ProductModel>> getProductsForBrand({required String brandId, int limit = -1}) async {
    try {
      // final querySnapshot = await _db.collection('products').where('Brand.Id', isEqualTo: true).get();
      // final products = querySnapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();

      final product = limit == -1 ? TDummyData.products.where((product) => product.brand!.id == brandId).toList()
                                  : TDummyData.products.where((product) => product.brand!.id == brandId).take(limit).toList();
      return product;
    } on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch(e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<List<ProductModel>> getProductsForCategory({required String categoryId, int limit = 4}) async {
    try {
      final product = limit == -1 ? TDummyData.products.where((product) => product.categoryId == categoryId).toList()
          : TDummyData.products.where((product) => product.categoryId == categoryId).take(limit).toList();
      return product;
    } on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch(e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<List<ProductModel>> getFavoriteProduct(List<String> productId) async {
    try {
      // final snapshot = await _db.collection('products').where(FieldPath.documentId, whereIn: productId).get();
      //
      // return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
      final products = TDummyData.products.where((element) => productId.contains(element.id)).toList();
      return products;
    } on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch(e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
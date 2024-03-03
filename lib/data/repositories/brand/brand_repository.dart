import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/models/brand_model.dart';
import 'package:t_store/utils/dummy/dummy_data.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  Future<List<BrandModel>> getAllBrands() async {
    try {
      // final snapshot = await _db.collection('brands').get();
      // final result = snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
      final result = TDummyData.brands;
      return result;
    } on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch(e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      // QuerySnapshot brand = await _db.collection('brandCategory').where('categoryId', isEqualTo: categoryId).get();
      // List<String> brandIds = brand.docs.map((e) => e['brandId'] as String).toList();
      // final brandsQuery = await _db.collection('Brands').where(FieldPath.documentId, whereIn: brandIds).limit(2).get();
      //
      // List<BrandModel> brands = brandsQuery.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
      // return brands;

      final brandCategory = TDummyData.brandCategory;
      final allBrands = TDummyData.brands;
      final brandId = brandCategory.where((element) => element.categoryId == categoryId).map((brandCategory) => brandCategory.brandId).toList();
      List<BrandModel> brands = allBrands.where((brand) => brandId.contains(brand.id)).toList();
      return brands;

    } on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch(e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
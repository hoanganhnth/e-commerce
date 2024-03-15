import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/utils/dummy/dummy_data.dart';

import '../../../features/shop/models/category_model.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('categories').get();
      final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
      return list;
    } on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch(e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }


  Future<List<CategoryModel>> getSubCategory(String categoryId) async {
    try {
      // final snapshot = await _db.collection('categories').where('ParentId', isEqualTo: categoryId).get();
      // final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();

      final list = TDummyData.categories.where((element) => element.parentId == categoryId).toList();
      return list;
    } on FirebaseException catch(e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch(e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
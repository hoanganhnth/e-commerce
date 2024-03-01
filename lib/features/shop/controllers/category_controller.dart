import 'package:get/get.dart';
import 'package:t_store/commom/widgets/loaders/loaders.dart';
import 'package:t_store/data/repositories/categories/category_repository.dart';
import 'package:t_store/utils/dummy/dummy_data.dart';

import '../models/category_model.dart';

class CategoryController extends GetxController {
  static CategoryController get instance  => Get.find();

  final _categoryRepository = Get.put(CategoryRepository());

  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  Future<void> fetchCategories() async{
    try {
      isLoading.value = true;
      // final categories = await _categoryRepository.getAllCategories();
      final categories = TDummyData.categories;
      allCategories.assignAll(categories);
      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());
    } catch(e){
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
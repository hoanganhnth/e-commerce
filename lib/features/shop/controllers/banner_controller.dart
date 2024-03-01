
import 'package:get/get.dart';
import 'package:t_store/data/repositories/banner/banner_repository.dart';
import 'package:t_store/features/shop/models/banner_model.dart';

import '../../../commom/widgets/loaders/loaders.dart';
import '../../../data/repositories/categories/category_repository.dart';
import '../../../utils/dummy/dummy_data.dart';

class BannerController extends GetxController {
  static BannerController get instance  => Get.find();

  final _bannerRepository = Get.put(BannerRepository());
  Rx<int> carousalCurrentIndex = 0.obs;
  RxList<BannerModel> banners = <BannerModel>[].obs;
  final isLoading = false.obs;

  void updatePageIndicator(index) => carousalCurrentIndex.value = index;


  @override
  void onInit() {
    super.onInit();
    fetchBanners();
  }

  Future<void> fetchBanners() async{
    try {
      isLoading.value = true;
      // final banners = await _bannerRepository.getAllBanners();
      final banners = TDummyData.banners;
      this.banners.assignAll(banners);

    } catch(e){
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
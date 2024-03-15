import 'package:get/get.dart';
import 'package:t_store/features/shop/controllers/product/variation_controller.dart';

class GeneralBindings extends Bindings {

  @override
  void dependencies() {
    Get.put(VariationController());
  }
}
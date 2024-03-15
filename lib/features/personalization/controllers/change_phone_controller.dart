import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';

import '../../../commom/widgets/loaders/loaders.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/popups/full_screen_loader.dart';

class ChangePhoneController extends GetxController {
  static ChangePhoneController get instance => Get.find();

  final phoneNumber = TextEditingController();

  GlobalKey<FormState> changePhoneFormKey = GlobalKey<FormState>();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    super.onInit();
    initializePhone();

  }

  Future<void> initializePhone() async{
    phoneNumber.text = userController.user.value.phoneNumber ?? '';
  }

  Future<void> updatePhoneNumber()async {
    try {
      TFullScreenLoader.openLoadingDialog('We are progressing your phone...', TImages.loadingAnimation);
      if (!changePhoneFormKey.currentState!.validate()) {
        TLoaders.warningSnackBar(title: 'Oh Snap!', message: 'Please enter the field');
        return ;
      }
      Map<String, dynamic> name = {'PhoneNumber': phoneNumber.text.trim()};
      await userRepository.updateSingleField(name);

      userController.user.value.phoneNumber = phoneNumber.text.trim();
      TLoaders.successSnackBar(title: 'Congratulation!', message: 'Your Phone Number has been updated');
    } catch(e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      TFullScreenLoader.stopLoading();
    }
  }
}
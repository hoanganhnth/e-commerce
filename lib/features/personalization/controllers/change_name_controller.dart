import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';

import '../../../commom/widgets/loaders/loaders.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/popups/full_screen_loader.dart';

class ChangeNameController extends GetxController {
  static ChangeNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();

  GlobalKey<FormState> changeNameFormKey = GlobalKey<FormState>();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    super.onInit();
    initializeName();

  }

  Future<void> initializeName() async{
    firstName.text = userController.user.value.firstName ?? '';
    lastName.text = userController.user.value.lastName ?? '';
  }

  Future<void> updateUserName()async {
    try {
      TFullScreenLoader.openLoadingDialog('We are progressing your name...', TImages.loadingAnimation);

      if (!changeNameFormKey.currentState!.validate()) {
        TLoaders.warningSnackBar(title: 'Oh Snap!', message: 'Please enter the field');
        return ;
      }
      Map<String, dynamic> name = {'FirstName': firstName.text.trim(), 'LastName': lastName.text.trim()};
      await userRepository.updateSingleField(name);

      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();
      userController.user.refresh();
      TLoaders.successSnackBar(title: 'Congratulation!', message: 'Your Name has been updated');
    } catch(e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      TFullScreenLoader.stopLoading();
    }
  }
}
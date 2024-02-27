import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/authentication/screens/password_configuration/reset_password.dart';

import '../../../../commom/widgets/loaders/loaders.dart';

class ForgetPasswordController extends GetxController{
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async {
    try {
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TLoaders.warningSnackBar(title: 'Oh Snap!', message: 'Please re-enter the Email');
        return ;
      }
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.toString());
      TLoaders.successSnackBar(title: 'Email sent', message: 'Email Link is sent  to reset your password');
      Get.to(() => ResetPasswordScreen(email: email.text.toString(),));
    } catch(e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  resendPasswordResetEmail() async {
    try {

      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.toString());
      TLoaders.successSnackBar(title: 'Email sent', message: 'Email Link is sent  to reset your password');
    } catch(e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
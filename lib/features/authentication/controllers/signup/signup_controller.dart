import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/commom/widgets/loaders/loaders.dart';
import 'package:t_store/features/personalization/models/user_model.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/authentication/screens/signup/verify_email.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final hidePassword = true.obs;
  final privacyPolicy = false.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  final userRepository = Get.put(UserRepository());

  Future<void> signup() async {
    try {
      // TFullScreenLoader.openLoadingDialog('We are progressing your information...', TImages.staticSuccessIllustration);
      if (!signupFormKey.currentState!.validate()) {
        TLoaders.warningSnackBar(title: 'Oh Snap!', message: 'Please enter the field');
        return ;
      }
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
            title: 'Accept Privacy',
            message:
                ' In order to create account, you must have to read and accept Privacy Policy and Terms of use');
        return;
      }
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          userName: userName.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '');


      userRepository.saveUserRecord(newUser);
      TLoaders.successSnackBar(title: 'Success!', message: 'Your account has been created! Verify email to continue');
      Get.to(() => VerifyEmailScreen(email: email.text,));
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {}
  }
}

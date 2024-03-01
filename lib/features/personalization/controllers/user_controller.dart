import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:t_store/commom/widgets/loaders/loaders.dart';
import 'package:t_store/features/personalization/models/user_model.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:t_store/utils/constants/sizes.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final hidePassword = true.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final profileLoading = false.obs;
  final imageUploading = false.obs;

  GlobalKey<FormState> authFormKey = GlobalKey<FormState>();
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }


  Future<void> fetchUserRecord() async {
    try {
      final user = await userRepository.fetchUserDetails();
      this.user(user);
      this.user.refresh();
      profileLoading.value = true;
      print(this.user.value.profilePicture);

    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      await fetchUserRecord();
      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          final nameParts =
          UserModel.nameParts(userCredential.user?.displayName ?? '');
          final userName =
          UserModel.generateUsername(userCredential.user?.displayName ?? '');

          final user = UserModel(
              id: userCredential.user!.uid,
              firstName: nameParts[0],
              lastName: nameParts.length > 1 ? nameParts.sublist(1).join() : '',
              userName: userName,
              email: userCredential.user!.email ?? '',
              phoneNumber: userCredential.user?.phoneNumber ?? '',
              profilePicture: '');

          await userRepository.saveUserRecord(user);
        }
      }

    } catch (e) {
      TLoaders.warningSnackBar(
          title: 'Data not saved',
          message:
              'Something went wrong with saving your information. You can re-save your data in your Profile.');
    }
  }

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(TSizes.md),
        title: 'Delete Account',
        middleText:
            'Are you sure you want to delete your account? Action is not reversible and all of your data will be removed permanently ',
        confirm: ElevatedButton(
          onPressed: () async => deleteUserAccount(),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
            child: Text('Delete'),
          ),
        ),
        cancel: OutlinedButton(
            onPressed: () => Navigator.of(Get.overlayContext!).pop(),
            child: const Text('Cancel')));
  }

  deleteUserAccount()async {
    try {
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          TLoaders.successSnackBar(title: 'Success. Your account has been deleted, please create a new account');
          Get.offAll(() => const LoginScreen());
        } else if (provider =='password') {
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
       if (!authFormKey.currentState!.validate()) {
         TLoaders.warningSnackBar(title: 'Oh Snap!', message: 'Please enter the field');
       }
       await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(verifyEmail.text.trim(),verifyPassword.text.trim());
       await AuthenticationRepository.instance.deleteAccount();
       TLoaders.successSnackBar(title: 'Success. Your account has been deleted, please create a new account');
       Get.offAll(()=> const LoginScreen());
    } catch (e){
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
  void uploadUserProfilePicture() async{
    try {
      print(user.value.profilePicture);
      final image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70, maxHeight: 512,maxWidth: 512);
      if (image != null) {
        imageUploading.value = true;
        final imageUrl = await userRepository.uploadImage("Users/Images/Profile", image);
        Map<String,dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);
        user.value.profilePicture = imageUrl;
        user.refresh();
        TLoaders.successSnackBar(title: 'Congratulations', message: 'Your profile image has been updated');
      }
    } catch (e) {
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      imageUploading.value = false;
    }
  }
}

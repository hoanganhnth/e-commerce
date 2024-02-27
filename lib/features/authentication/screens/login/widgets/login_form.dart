
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:t_store/features/authentication/screens/signup/signup.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/validators/validation.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../controllers/login/login_controller.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: TSizes.spaceBtwSections),
          child: Column(
            children: [
              TextFormField(
                controller: controller.email,
                validator: (value) => TValidator.validateEmail(value),
                decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: TTexts.email),
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),
              Obx(
                ()=> TextFormField(
                  controller: controller.password,
                  obscureText: controller.hidePassword.value,
                  validator: (value) => TValidator.validateEmptyText('Password',value ),
                  decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.direct_right),
                      labelText: TTexts.password,
                      suffixIcon: IconButton(
                          onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                          icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye))),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields / 2,
              ),

              // Remember me
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Obx(()=> Checkbox(value: controller.rememberMe.value, onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value)),
                      const Text(TTexts.rememberMe)
                    ],
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(() => const ForgetPasswordScreen());
                      },
                      child: const Text(TTexts.forgetPassword))
                ],
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => controller.emailAndPasswordSignIn(),
                      child: const Text(TTexts.signIn))),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () {
                      Get.to(() => const SignupScreen());
                    },
                    child: const Text(TTexts.createAccount)),
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
            ],
          ),
        ));
  }
}
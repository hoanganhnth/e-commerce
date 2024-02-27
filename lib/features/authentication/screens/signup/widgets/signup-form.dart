import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/authentication/controllers/signup/signup_controller.dart';
import 'package:t_store/features/authentication/screens/signup/verify_email.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import 'package:t_store/utils/validators/validation.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(SignupController());
    return Form(
        key: controller.signupFormKey,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
          child: Column(
            children: [
              // Firstname, Lastname
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller.firstName,
                      validator: (value) =>
                          TValidator.validateEmptyText("First name", value),
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.user),
                          labelText: TTexts.firstName),
                    ),
                  ),
                  const SizedBox(width: TSizes.spaceBtwInputFields),
                  Expanded(
                    child: TextFormField(
                      controller: controller.lastName,
                      validator: (value) =>
                          TValidator.validateEmptyText("Last name", value),
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.user),
                          labelText: TTexts.lastName),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),
              // Username
              TextFormField(
                controller: controller.userName,
                validator: (value) =>
                    TValidator.validateEmptyText("User name", value),
                decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user_edit),
                    labelText: TTexts.username),
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),
              // email
              TextFormField(
                validator: (value) => TValidator.validateEmail(value),
                controller: controller.email,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct), labelText: TTexts.email),
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),
              // phone, ...
              TextFormField(
                validator: (value) => TValidator.validatePhoneNumber(value),
                controller: controller.phoneNumber,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.call), labelText: TTexts.phoneNo),
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields,
              ),
              // password, ...
              Obx(
                () => TextFormField(
                  validator: (value) => TValidator.validatePassword(value),
                  controller: controller.password,
                  obscureText: controller.hidePassword.value,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.password_check),
                      labelText: TTexts.password,
                      suffixIcon: IconButton(
                          onPressed: () => controller.hidePassword.value =
                              !controller.hidePassword.value,
                          icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye))),
                ),
              ),

              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              // policy
              Row(
                children: [
                  SizedBox(
                      width: 24,
                      height: 24,
                      child: Obx(() => Checkbox(value: controller.privacyPolicy.value, onChanged: (value) =>controller.privacyPolicy.value = !controller.privacyPolicy.value))),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Expanded(
                    child: Text.rich(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        TextSpan(children: [
                          TextSpan(
                              text: TTexts.iAgreeTo,
                              style: Theme.of(context).textTheme.bodySmall),
                          TextSpan(
                              text: ' ${TTexts.privacyPolicy} ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .apply(
                                    color:
                                        dark ? TColors.white : TColors.primary,
                                    decoration: TextDecoration.underline,
                                    decorationColor:
                                        dark ? TColors.white : TColors.primary,
                                  )),
                          TextSpan(
                              text: TTexts.and,
                              style: Theme.of(context).textTheme.bodySmall),
                          TextSpan(
                              text: ' ${TTexts.termsOfUse} ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .apply(
                                    color:
                                        dark ? TColors.white : TColors.primary,
                                    decoration: TextDecoration.underline,
                                    decorationColor:
                                        dark ? TColors.white : TColors.primary,
                                  )),
                        ])),
                  ),
                ],
              ),
              // button signup
              const SizedBox(height: TSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    controller.signup();
                    // Get.to(() => const VerifyEmailScreen());
                  },
                  child: const Text(TTexts.createAccount),
                ),
              ),
            ],
          ),
        ));
  }
}

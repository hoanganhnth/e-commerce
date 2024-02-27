import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';

import '../../../../../commom/widgets/appbar/appbar.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/validators/validation.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = UserController();
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Re-Authenticate User'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Form(
                  key: controller.authFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.verifyEmail,
                        validator: (value) =>
                            TValidator.validateEmail(value),
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.direct),
                            labelText: TTexts.email),
                      ),
                      const SizedBox(height: TSizes.spaceBtwInputFields,),
                      Obx(
                        ()=> TextFormField(
                          controller: controller.verifyPassword,
                          obscureText: controller.hidePassword.value,
                          validator: (value) =>
                              TValidator.validateEmptyText('Password', value),
                          decoration: InputDecoration(
                              prefixIcon: Icon(Iconsax.password_check),
                              suffixIcon: IconButton(
                                  onPressed: () => controller.hidePassword.value =
                                  !controller.hidePassword.value,
                                  icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye)),
                              labelText: TTexts.password),
                        ),
                      ),

                      const SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: ()=> controller.reAuthenticateEmailAndPasswordUser(), child: const Text('Verify')),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

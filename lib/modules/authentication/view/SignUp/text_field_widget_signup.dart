import 'package:demo/modules/authentication/view/SignUp/signup_button.dart';
import 'package:demo/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'check_box.dart';

class TextFieldWidgetSignUp extends StatelessWidget {
  final Rx<bool> isChecked;
  final RxBool isObscure;

  const TextFieldWidgetSignUp({
    super.key,
    required this.isChecked,
    required this.isObscure,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController firstNameController = TextEditingController();
    final TextEditingController lastNameController = TextEditingController();
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController mobileNumberController =
        TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          /// First + Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: firstNameController,
                  decoration: const InputDecoration(
                    labelText: 'First Name',
                    prefixIcon: Icon(Iconsax.user_edit),
                  ),
                ),
              ),
              const SizedBox(width: TSizes.defaultItemSpace),
              Expanded(
                child: TextFormField(
                  controller: lastNameController,
                  decoration: const InputDecoration(
                    labelText: 'Last Name',
                    prefixIcon: Icon(Iconsax.user_edit4),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.defaultSectionSpace),

          /// Username
          TextFormField(
            controller: usernameController,
            decoration: const InputDecoration(
              labelText: 'Username',
              prefixIcon: Icon(Iconsax.user),
            ),
          ),
          const SizedBox(height: TSizes.defaultSectionSpace),

          /// Email
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Iconsax.arrow_right),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: TSizes.defaultSectionSpace),

          /// Mobile Number
          TextFormField(
            controller: mobileNumberController,
            decoration: const InputDecoration(
              labelText: 'Mobile Number',
              prefixIcon: Icon(Iconsax.call),
            ),
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: TSizes.defaultSectionSpace),

          /// Password
          Obx(
            () => TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  icon: Icon(
                    isObscure.value ? Iconsax.eye_slash : Iconsax.eye,
                    color: isObscure.value ? Colors.grey : Colors.blue,
                  ),
                  onPressed: () {
                    isObscure.value = !isObscure.value;
                  },
                ),
              ),
              obscureText: isObscure.value,
            ),
          ),

          const SizedBox(height: TSizes.defaultSpace),

          /// Checkbox
          CheckBoxWidget(isChecked: isChecked),

          Obx(
            () => SignUpWidget(
              isChecked: isChecked.value,
              firstName: firstNameController.text.trim(),
              lastName: lastNameController.text.trim(),
              username: usernameController.text.trim(),
              email: emailController.text.trim(),
              phone: mobileNumberController.text.trim(),
              password: passwordController.text.trim(),
            ),
          ),
        ],
      ),
    );
  }
}

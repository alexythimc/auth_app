import 'package:demo/modules/authentication/view/SignUp/text_field_widget_signup.dart';
import 'package:demo/modules/authentication/view/SignUp/title_text.dart';
import 'package:demo/modules/authentication/viewModel/signup_controller.dart';
import 'package:demo/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../logIn/google_facebook_logo.dart';
import '../logIn/or_divider.dart';

class SignUp extends GetView<SignUpController> {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleText(),
              const SizedBox(height: TSizes.defaultSpace),
              TextFieldWidgetSignUp(
                isChecked: controller.isChecked,
                isObscure: controller.isObscure,
              ),

              /// checkbox for terms and conditions
              const SizedBox(height: TSizes.defaultSpace),

              /// Sign Up Button
              // SignUpWidget(),
              const SizedBox(height: TSizes.defaultSpace),
              OrDivider(),
              GoogleNFacebookLogo(),
            ],
          ),
        ),
      ),
    );
  }
}

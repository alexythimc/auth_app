import 'package:demo/modules/authentication/viewModel/login_controller.dart';
import 'package:demo/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'google_facebook_logo.dart';
import 'or_divider.dart';
import 'text_field_widget.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //add image here
              SizedBox(height: TSizes.appBarHeight),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Welcome Back,Buddy!',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),

              TextfieldsWidget(
                login: controller.login,
                isObscure: controller.isObscure,
              ),
              SizedBox(height: TSizes.gridViewSpacing),

              /// OR Divider
              OrDivider(),
              SizedBox(height: TSizes.gridViewSpacing),

              /// Social Media Buttons
              GoogleNFacebookLogo(),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

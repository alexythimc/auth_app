import 'package:demo/modules/authentication/viewModel/login_controller.dart';
import 'package:demo/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Iconsax.close_circle),
            ),
          ],
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Forgot Password",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
            const SizedBox(height: TSizes.gridViewSpacing),
            Text(
              "It's okay ,sometimes people forget things,Please enter your email address to reset your password.",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: TSizes.appBarHeight),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Iconsax.arrow_right),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.resetPassword(),
                  child: const Text("Reset Password"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

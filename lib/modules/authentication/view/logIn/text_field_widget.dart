import 'package:demo/modules/authentication/view/logIn/forgot_password.dart';
import 'package:demo/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TextfieldsWidget extends StatelessWidget {
  final void Function(String, String) login;
  final RxBool isObscure;

  const TextfieldsWidget({
    super.key,
    required this.login,
    required this.isObscure,
  });

  @override
  Widget build(BuildContext context) {
    // text editing controllers for email and password
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: SizedBox(
        child: Column(
          children: [
            SizedBox(height: TSizes.buttonIconSize),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Iconsax.arrow_right),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),

            /// Password
            Obx(
              () => TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Iconsax.password_check),
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
                obscureText: isObscure.value ? true : false,
              ),
            ),
            SizedBox(height: 16),

            /// Login Button with my theme
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => login(
                  emailController.text.trim(),
                  passwordController.text.trim(),
                ),
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                // text with bold font in my theme
                child: Text("LogIn", style: TextTheme().titleLarge),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Get.to(() => ForgotPassword()),
                  child: Text("Forgot Password?"),
                ),
              ],
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.toNamed('/signUp'),
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.black),
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                child: Text("Create Account", style: TextTheme().titleLarge),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

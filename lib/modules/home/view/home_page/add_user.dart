import 'package:demo/modules/home/viewModel/home_controller.dart';
import 'package:demo/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AddUser extends GetView<HomeController> {
  const AddUser({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController firstNameController = TextEditingController();
    final TextEditingController lastNameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add User",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            /// First + Last Name
            SizedBox(height: TSizes.defaultSectionSpace),
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

            /// Password
            Obx(
              () => TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isObscure.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye,
                      color: controller.isObscure.value
                          ? Colors.grey
                          : Colors.blue,
                    ),
                    onPressed: () {
                      controller.isObscure.value = !controller.isObscure.value;
                    },
                  ),
                ),
                obscureText: controller.isObscure.value,
              ),
            ),
            const SizedBox(height: TSizes.defaultSectionSpace),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text(
                    "Add User",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () => controller.addUser(
                    firstName: firstNameController.text.trim(),
                    lastName: lastNameController.text.trim(),
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

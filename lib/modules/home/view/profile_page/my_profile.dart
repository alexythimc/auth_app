import 'package:demo/modules/home/view/home_page/actions_widget.dart';
import 'package:demo/modules/home/view/profile_page/profile_button.dart';
import 'package:demo/modules/home/view/profile_page/profile_field.dart';
import 'package:demo/modules/home/viewModel/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProfile extends GetView<HomeController> {
  final Map<String, dynamic> user;
  String? title;

  MyProfile({super.key, required this.user, this.title = "My Profile"});

  @override
  Widget build(BuildContext context) {
    // Initialize the controllers with user data when the page is built
    controller.setUser(user);

    return Scaffold(
      appBar: AppBar(
        title: Text(title!, style: Theme.of(context).textTheme.headlineMedium),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Reset to read-only mode when going back
            controller.isReadOnly.value = true;
            Get.back();
          },
        ),
        actions: [
          ActionsWidget(
            user: user,
            onTap: controller.setUser,
            isReadOnly: controller.isReadOnly,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Profile Information',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Form Fields
            Obx(
              () => ProfileField(
                label: "Full Name",
                controller: controller.nameController.value,
                isReadOnly: controller.isReadOnly.value,
                icon: Icons.person,
              ),
            ),
            const SizedBox(height: 16),
            Obx(
              () => ProfileField(
                label: "Email Address",
                controller: controller.emailController.value,
                isReadOnly: controller.isReadOnly.value,
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            const SizedBox(height: 16),
            Obx(
              () => ProfileField(
                label: "Password",
                controller: controller.passwordController.value,
                obscure: controller.isObscure,
                isReadOnly: controller.isReadOnly.value,
                icon: Icons.lock,
              ),
            ),

            const SizedBox(height: 32),

            // Action Buttons
            Text(
              'Account Actions',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Save Changes Button
            ProfileButton(
              buttonText: "Save Changes",
              color: Colors.green,
              icon: Icons.save,
              isReadOnly: controller.isReadOnly,
              onPressed: () => controller.updateUser(user: user),
            ),

            // Delete Account Button
            ProfileButton(
              buttonText: "Delete Account",
              color: Colors.red,
              icon: Icons.delete_forever,
              onPressed: () => controller.deleteUser(user['id']),
            ),

            /// Log Out Button
            ProfileButton(
              buttonText: "Log Out",
              color: Colors.orange,
              icon: Icons.logout,
              onPressed: () => controller.signOut(),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

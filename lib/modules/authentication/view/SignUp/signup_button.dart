import 'package:demo/modules/authentication/viewModel/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpWidget extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String password;
  final String phone;
  final bool isChecked;

  const SignUpWidget({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phone,
    required this.username,
    required this.isChecked,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (isChecked) {
                  // otherwise call controller.signup
                  controller.signUp(
                    firstName: firstName,
                    lastName: lastName,
                    username: username,
                    email: email,
                    password: password,
                    phone: phone,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text("Sign Up"),
            ),
          ),
        );
      },
    );
  }
}

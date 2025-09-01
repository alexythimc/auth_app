import 'dart:ui';

import 'package:demo/data/services/auth_service.dart';
import 'package:demo/modules/authentication/view/logIn/forgot_password_email_verifivation.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final AuthService _authService = AuthService();
  final RxBool isPasswordVisible = false.obs;
  final RxBool isLoading = false.obs;

  final RxBool isObscure = true.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void resetPassword() {
    Get.to(
      () => const ForgotPasswordEmailVerification(),
      transition: Transition.downToUp,
    );
  }

  Future<void> login(String email, String password) async {
    print("in login method");

    try {
      if (await _authService.login(email, password)) {
        Get.offAllNamed('/home');
        Get.snackbar("Login", "Login Successful");
      } else {
        Get.snackbar(
          "Login",
          "Login Failed",
          backgroundColor: const Color(0xFFFF0000),
          colorText: const Color(0xFFFFFFFF),
        );
      }
    } catch (e) {
      Get.snackbar(
        "Login Error",
        e.toString(),
        backgroundColor: const Color(0xFFFF0000),
        colorText: const Color(0xFFFFFFFF),
      );
    }
  }
}

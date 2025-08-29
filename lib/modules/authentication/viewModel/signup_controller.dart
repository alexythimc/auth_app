import 'package:demo/data/models/user.dart';
import 'package:demo/data/services/auth_service.dart';
import 'package:demo/modules/authentication/view/email_verification/emailVerificationScreen.dart';
import 'package:demo/modules/authentication/view/email_verification/success_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Rx<bool> isChecked = false.obs;
  final AuthService auth = AuthService();

  void changeCheckbox(bool bool) {
    debugPrint("Checkbox value: $bool");
    isChecked.value = bool;
  }

  void signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String username,
    required String phone,
  }) {
    // user to map and send to api
    final user = User(
      email: email,
      password: password,
      name: '$firstName $lastName',
    ).toJson();
    debugPrint("User data: $user");

    auth.signUp(user);
    Get.showSnackbar(
      const GetSnackBar(
        title: 'Success',
        message: 'Account created successfully',
        duration: Duration(seconds: 2),
      ),
    );
    Get.to(
      () =>
          const Emailverificationscreen(), // Replace with your actual email verification screen widget
      transition: Transition.fadeIn,
    );
  }

  void verifyEmail() {
    Get.to(
      () =>
          const SuccessScreen(), // Replace with your actual email verification success screen widget
      transition: Transition.downToUp,
    );
  }
}

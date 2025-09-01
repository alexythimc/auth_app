import 'package:demo/data/models/user.dart';
import 'package:demo/data/services/auth_service.dart';
import 'package:demo/data/services/user_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Rx<bool> isChecked = false.obs;
  final UserService userService = UserService();
  final AuthService auth = AuthService();

  final RxBool isObscure = true.obs;

  void changeCheckbox(bool bool) {
    debugPrint("Checkbox value: $bool");
    isChecked.value = bool;
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String username,
    required String phone,
  }) async {
    // user to map and send to api
    final user = User(
      email: email,
      password: password,
      name: '$firstName $lastName',
    ).toJson();
    debugPrint("User data: $user");

    try {
      await auth.signUp(user);
    } catch (e) {
      Get.snackbar(
        "Sign Up Error",
        e.toString(),
        backgroundColor: const Color(0xFFFF0000),
        colorText: const Color(0xFFFFFFFF),
      );
      return;
    }
    Get.toNamed('/');
    Get.showSnackbar(
      const GetSnackBar(
        title: 'Success',
        message: 'Account created successfully',
        duration: Duration(seconds: 2),
      ),
    );
  }

  void verifyEmail() {}
}

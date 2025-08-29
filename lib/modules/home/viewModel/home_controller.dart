import 'package:demo/data/services/user_service.dart';
import 'package:demo/modules/home/view/profile_page/my_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //init controller and variables
  @override
  void onInit() {
    super.onInit();
    getUsers(); // fetch when controller is initialized
  }

  final UserService _userService = UserService();
  var users = <Map<String, dynamic>>[].obs;
  // before fetching users
  Rx<bool> isLoading = true.obs;

  // for read only mode in profile page
  RxBool isReadOnly = true.obs;

  // text field controllers for profile page
  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  final Rx<TextEditingController> passwordController =
      TextEditingController().obs;

  RxBool isObscure = true.obs;

  /// 🔹 Initialize profile controllers when opening profile
  void setUser(Map<String, dynamic> user) {
    nameController.value.text = user['name'] ?? "";
    emailController.value.text = user['email'] ?? "";
    passwordController.value.text = user['password'] ?? "";
  }

  Future<void> signOut() async {
    if (await _userService.signOut()) {
      Get.offAllNamed('/');
      Get.snackbar("Sign Out", "Sign Out Successful");
    }
  }

  // list of users method
  Future<List<Map<String, dynamic>>> getUsers() async {
    isLoading.value = true;
    users.assignAll(await _userService.fetchUsersData());
    isLoading.value = false;
    return users;
  }

  /// 🔹 Refresh users list from the service
  Future<void> refreshUsers() async {
    await getUsers();
  }

  /// 🔹 Update user in local list immediately after successful update
  void updateUserInList(Map<String, dynamic> updatedUser) {
    final index = users.indexWhere((user) => user['id'] == updatedUser['id']);
    if (index != -1) {
      users[index] = updatedUser;
      users.refresh(); // Trigger UI update
    }
  }

  /// 🔹 Remove user from local list immediately after deletion
  void removeUserFromList(int userId) {
    users.removeWhere((user) => user['id'] == userId);
  }

  void editUser(Map<String, dynamic> user) {
    setUser(user);
    Get.to(() => MyProfile(user: user, title: 'Profile Page'));
  }

  void deleteUser(int id) {
    // show dialog to confirm delete
    Get.defaultDialog(
      title: "Delete User",
      middleText: "Are you sure you want to delete this user?",
      textCancel: "No",
      textConfirm: "Yes",
      onConfirm: () {
        try {
          _userService.deleteUserById(id);
          removeUserFromList(id); // Update local list immediately
          Get.back();
          Get.offAllNamed('/');
          Get.snackbar("Delete User", "User Deleted Successfully");
        } catch (e) {
          Get.back();
          Get.snackbar("Error", "Failed to delete user: $e");
        }
      },
      onCancel: () {},
    );
  }

  Future<void> updateUser({required Map<String, dynamic> user}) async {
    final name = nameController.value.text.trim();
    final email = emailController.value.text.trim();
    final password = passwordController.value.text.trim();

    Map<String, dynamic> updatedUser = {
      'id': user['id'],
      'name': name,
      'email': email,
      'password': password,
    };

    if (kDebugMode) {
      print("updatedUser $updatedUser");
    }

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      Get.snackbar("Update User", "Please fill all the fields");
      return;
    }

    if (user['name'] == updatedUser['name'] &&
        user['email'] == updatedUser['email'] &&
        user['password'] == updatedUser['password']) {
      Get.snackbar("Update User", "No changes made");
      isReadOnly.value = true;
      return;
    }

    try {
      await _userService.updateUser(user, updatedUser);

      // Update the local list immediately to reflect changes
      print("Updating user in controller list");
      updateUserInList(updatedUser);
      print("User updated successfully in controller");

      Get.snackbar("Update User", "User Updated Successfully");
      print("User updated successfully in database");
      isReadOnly.value = true;
    } catch (e) {
      if (kDebugMode) {
        Get.snackbar("Error", "Error updating user: $e");
      }
    }
  }

  @override
  void onClose() {
    nameController.value.dispose();
    emailController.value.dispose();
    passwordController.value.dispose();
    super.onClose();
  }
}

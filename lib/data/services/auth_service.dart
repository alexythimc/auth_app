import 'package:demo/core/localization/local_stoage_service.dart';
import 'package:demo/data/repos/user_repo.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  final UserRepo userRepo = UserRepo();
  final LocalStorageService localStorageService = LocalStorageService();

  void signUp(Map<String, dynamic> user) {
    try {
      // call UserRepo API to sign up user
      userRepo.addUser(user);
      // Save user data to local storage
      localStorageService.write('user', user);
      print('AuthService:User signed up successfully: $user');
    } catch (e) {
      print('Error during sign up: $e');
    }
  }

  Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));

    if (email.isEmpty || password.isEmpty) {
      return false;
    }

    if (await userRepo.userExists(email, password)) {
      final newStatus = await userRepo.setIsLoggedIn(email, true);
      if (newStatus != null) {
        localStorageService.remove('user');
        localStorageService.write('user', await userRepo.getUserByEmail(email));
        localStorageService.read('user');
        return newStatus;
      }
    }

    return false;
  }
}

import 'package:demo/core/localization/local_stoage_service.dart';
import 'package:demo/data/repos/user_repo.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  final UserRepo userRepo = UserRepo();
  final LocalStorageService localStorageService = LocalStorageService();

  Future<void> signUp(Map<String, dynamic> user) async {
    try {
      await userRepo.addUser(user);
      await localStorageService.write('user', user);
    } catch (e) {
      throw Exception('Error signing up user: $e');
    }

    print('AuthService: User signed up successfully: $user');
  }

  Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));

    if (email.isEmpty || password.isEmpty) {
      throw Exception('Email and password cannot be empty');
    }

    // First check if user exists by email
    final user = await userRepo.getUserByEmail(email);

    if (user == null) {
      throw Exception('User does not exist');
    }

    // Check password
    if (user['password'] != password) {
      throw Exception('Incorrect password');
    }

    // If everything is fine, log in user
    final newStatus = await userRepo.setIsLoggedIn(email, true);
    if (newStatus != null) {
      localStorageService.remove('user');
      localStorageService.write('user', user);
      localStorageService.read('user');

      return newStatus;
    }

    return false;
  }
}

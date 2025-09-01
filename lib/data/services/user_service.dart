import 'package:demo/core/localization/local_stoage_service.dart';
import 'package:demo/data/repos/user_repo.dart';
import 'package:get/get.dart';

class UserService extends GetxService {
  final UserRepo _userRepo = UserRepo();
  final localStorageService = LocalStorageService();

  // Simulate a user data fetch
  Future<List<Map<String, dynamic>>> fetchUsersData() async {
    await Future.delayed(Duration(seconds: 2));
    var result = await _userRepo.getUsers();
    if (result.isEmpty) {
      return [];
    }
    return result;
  }

  Future<bool> signOut() async {
    print('Service: Signing out user...');

    final email = localStorageService.read('user')['email'];

    // Force set login state to false in DB
    await _userRepo.setIsLoggedIn(email, false);

    // Now fetch fresh user data from DB
    final updatedUser = await _userRepo.getUserByEmail(email);

    // Clear and overwrite local storage
    await localStorageService.clearAll();
    await localStorageService.write('user', updatedUser);

    print('Service: User signed out successfully => $updatedUser');
    return true;
  }

  Future<void> updateUser(user, Map<String, dynamic> updatedUser) async {
    print(user['id']);
    _userRepo.updateUser(user['id'], updatedUser);
    localStorageService.write('user', updatedUser);
    // refresh user data in local storage
  }

  Future<Map<String, dynamic>?> fetchUserByEmail(String email) async {
    return await _userRepo.getUserByEmail(email);
  }

  Future<void> deleteUserById(int id) async {
    await _userRepo.deleteUserById(id);
    print('Service: User deleted successfully');
  }

  Future<void> addUser(Map<String, String> map) async {
    await _userRepo.addUser(map);
  }
}

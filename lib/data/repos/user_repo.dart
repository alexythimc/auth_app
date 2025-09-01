import 'package:demo/data/services/database_service.dart';

class UserRepo {
  final DatabaseService _databaseService = DatabaseService();

  Future<void> addUser(Map<String, dynamic> user) async {
    final db = await _databaseService.database;
    // check if user with same email exists
    final existingUser = await db.query(
      'user',
      where: 'email = ?',
      whereArgs: [user['email']],
    );
    print('Existing user check: $existingUser');
    if (existingUser.isNotEmpty) {
      throw Exception('User with this email already exists');
    }
    print('Adding user: $user');
    await db.insert('user', user);
    print('User added successfully');
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await _databaseService.database;
    return await db.query('user');
  }

  Future<void> deleteUser(int id) async {
    final db = await _databaseService.database;
    await db.delete('user', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateUser(int id, Map<String, dynamic> user) async {
    final db = await _databaseService.database;
    await db.update('user', user, where: 'id = ?', whereArgs: [id]);
  }

  Future<Map<String, dynamic>?> getUserById(int id) async {
    final db = await _databaseService.database;
    final result = await db.query('user', where: 'id = ?', whereArgs: [id]);
    return result.isNotEmpty ? result.first : null;
  }

  Future<void> deleteUserById(int id) async {
    final db = await _databaseService.database;
    await db.delete('user', where: 'id = ?', whereArgs: [id]);
  }

  Future<bool> userExists(String email, String password) async {
    final db = await _databaseService.database;
    final result = await db.query(
      'user',
      where: 'email = ?',
      whereArgs: [email],
    );
    if (result[0]['password'] != password) {
      print("Password mismatch for user: ${result[0]}");
      Exception('Incorrect password');
    }
    if (result.isNotEmpty && result[0]['password'] == password) {
      print("User found: ${result[0]}");
      return true;
    }

    return false;
  }

  Future<bool> setIsLoggedIn(String email, bool status) async {
    print("Setting isLoggedIn for $email to $status");
    final db = await _databaseService.database;
    final rowsAffected = await db.update(
      'user',
      {'isLoggedIn': status ? 1 : 0},
      where: 'email = ?',
      whereArgs: [email],
    );
    print("Rows affected: $rowsAffected");
    print("isLoggedIn set to $status for $email");
    return rowsAffected > 0;
  }

  Future<bool?> toggleIsLoggedIn(String email) async {
    final user = await getUserByEmail(email);
    if (user == null) return null;

    final currentStatus = user['isLoggedIn'] == 1;
    final newStatus = !currentStatus;

    final db = await _databaseService.database;
    final rowsAffected = await db.update(
      'user',
      {'isLoggedIn': newStatus ? 1 : 0},
      where: 'email = ?',
      whereArgs: [email],
    );

    return rowsAffected > 0 ? newStatus : null;
  }

  Future<Map<String, dynamic>?> getUserByEmail(String email) async {
    final db = await _databaseService.database;
    final result = await db.query(
      'user',
      where: 'email = ?',
      whereArgs: [email],
      limit: 1,
    );
    return result.isNotEmpty ? result.first : null;
  }
}

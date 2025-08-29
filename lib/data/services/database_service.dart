import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' show join;
class DatabaseService {
  static final DatabaseService instance = DatabaseService._internal();
  factory DatabaseService() {
    return instance;
  }

  DatabaseService._internal();

  static Database? _databaseService;

  // delete database


  Future<Database> get database async {
    debugPrint( "getting database");
    if (_databaseService != null) {
      debugPrint( "database already exists");
      return
      _databaseService!;
    }
    _databaseService = await _initDatabase();
    return _databaseService!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'db1.db');

    debugPrint( "creating database");
    var db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute(
          '''
          CREATE TABLE user(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          email TEXT,
          password TEXT,
          isLoggedIn INTEGER DEFAULT 0
        )
          
          '''
        );
        debugPrint("Database created with user table");
      },
    );
    return db;
  }
}
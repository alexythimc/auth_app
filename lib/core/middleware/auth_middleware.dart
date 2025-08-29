import 'package:demo/core/localization/local_stoage_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';

class AuthMiddleWare extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final user = LocalStorageService().read('user') as Map<String, dynamic>?;
    final isLoggedIn = user?['isLoggedIn'] ?? 0;

    if (kDebugMode) {
      print('AuthMiddleWare: user = $user');
      print('AuthMiddleWare: isLoggedIn = $isLoggedIn, route = $route');
    }

    if (isLoggedIn == 1 && route == '/') {
      return const RouteSettings(name: '/home');
    }

    if (isLoggedIn == 0 && route != '/') {
      return const RouteSettings(name: '/');
    }

    return null;
  }
}

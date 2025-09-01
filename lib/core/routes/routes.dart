import 'package:demo/bindings/home_bindings.dart';
import 'package:demo/bindings/login_bindings.dart';
import 'package:demo/bindings/signup_bindings.dart';
import 'package:demo/core/localization/local_stoage_service.dart';
import 'package:demo/core/middleware/auth_middleware.dart';
import 'package:demo/modules/authentication/view/SignUp/sign_up.dart';
import 'package:demo/modules/authentication/view/logIn/login.dart';
import 'package:demo/modules/home/view/home_page/add_user.dart';
import 'package:demo/modules/home/view/home_page/home_page.dart';
import 'package:demo/modules/home/view/profile_page/my_profile.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class Routes {
  Routes._();

  static var routes = [
    GetPage(
      name: '/',
      page: () => const LoginPage(),
      binding: LoginBindings(),
      middlewares: [AuthMiddleWare()],
    ),
    GetPage(
      name: '/home',
      page: () => const HomePage(),
      binding: HomeBindings(),
      //middlewares: [AuthMiddleWare()],
    ),
    GetPage(
      name: '/signUp',
      page: () => const SignUp(),
      binding: SingUpBindings(),
    ),
    GetPage(
      name: '/myProfile',
      page: () => MyProfile(user: LocalStorageService().read('user') ?? {}),
    ),
    GetPage(name: '/addUser', page: () => AddUser(), binding: SingUpBindings()),
  ];
}

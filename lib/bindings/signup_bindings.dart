import 'package:demo/modules/authentication/viewModel/signup_controller.dart';
import 'package:get/get.dart';

class SingUpBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController());
  }
}

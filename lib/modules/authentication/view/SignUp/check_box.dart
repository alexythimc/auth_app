import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../viewModel/signup_controller.dart';

class CheckBoxWidget extends GetView<SignUpController> {

  final Rx<bool> isChecked ;
   const CheckBoxWidget({
    super.key,
    required this.isChecked,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Obx(
          ()=> Checkbox(
            value: controller.isChecked.value,
            onChanged: (value) {
              controller.changeCheckbox(value!);
            },
          ),
        ),
        const Text("I agree to the terms and conditions"),
      ],
    );
  }
}

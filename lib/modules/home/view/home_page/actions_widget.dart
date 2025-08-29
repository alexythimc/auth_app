import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActionsWidget extends StatelessWidget {
  ActionsWidget({
    super.key,
    required this.user,
    required this.onTap,
    required this.isReadOnly, // ✅ now passed in, not created inside
  });

  final Map<String, dynamic> user;
  final void Function(Map<String, dynamic>) onTap;
  final RxBool isReadOnly; // ✅ state comes from controller

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => IconButton(
        icon: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: Icon(
            isReadOnly.value ? Icons.edit : Icons.edit_off,
            key: ValueKey(isReadOnly.value), // ✅ key based on value
            color: isReadOnly.value ? Colors.black : Colors.blue,
          ),
        ),
        onPressed: () {
          isReadOnly.value = !isReadOnly.value;
          // If switching back to read-only, reset fields
          if (isReadOnly.value) {
            onTap(user);
          }
        },
        tooltip: isReadOnly.value ? 'Edit Profile' : 'Cancel Edit',
      ),
    );
  }
}

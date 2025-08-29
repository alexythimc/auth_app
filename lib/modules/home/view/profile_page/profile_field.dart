import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final RxBool? obscure; // Only reactive if password field
  final bool isReadOnly;
  final IconData icon;
  final TextInputType? keyboardType;

  const ProfileField({
    super.key,
    required this.label,
    required this.controller,
    this.obscure, // pass null if not password
    this.isReadOnly = true,
    required this.icon,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isReadOnly ? Colors.grey[50] : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isReadOnly ? Colors.grey[300]! : Colors.blue[300]!,
        ),
      ),
      child: (obscure != null)
          ? Obx(() => _buildTextField(obscure!.value))
          : _buildTextField(false), // No rebuild if not reactive
    );
  }

  Widget _buildTextField(bool isObscure) {
    return TextField(
      controller: controller,
      readOnly: isReadOnly,
      obscureText: isObscure,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          icon,
          color: isReadOnly ? Colors.grey[600] : Colors.blue,
        ),
        suffixIcon: (obscure != null && !isReadOnly)
            ? IconButton(
                icon: Icon(
                  isObscure ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey[600],
                ),
                onPressed: () => obscure!.value = !obscure!.value,
              )
            : null,
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        labelStyle: TextStyle(
          color: isReadOnly ? Colors.grey[600] : Colors.blue[700],
        ),
      ),
      style: TextStyle(
        color: isReadOnly ? Colors.grey[800] : Colors.black,
        fontWeight: isReadOnly ? FontWeight.w400 : FontWeight.w500,
      ),
    );
  }
}

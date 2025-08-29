import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class UserListWidget extends StatelessWidget {
  List<Map<String, dynamic>> userList;
  final Function(Map<String, dynamic>)? onEdit;
  Rx<bool> isLoading;
  final Function(int)? onDelete;
  UserListWidget({
    super.key,
    this.userList = const [],
    this.onEdit,
    this.onDelete,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      if (userList.isEmpty) {
        return const Center(child: Text('No users found'));
      }
      return ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          final user = userList[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              leading: CircleAvatar(child: Text(user['name'][0])),
              title: Text(user['name']),
              subtitle: Text(user['email']),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () => onEdit!(user),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => onDelete!(user['id']),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}

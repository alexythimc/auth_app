import 'package:demo/modules/home/view/home_page/user_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../viewModel/home_controller.dart';
import 'list_of_users_titile.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Text(
          'Home Page',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          // refresh button
          IconButton(
            onPressed: () => controller.refreshUsers(),
            icon: const Icon(Icons.refresh),
          ),

          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => controller.signOut(),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            width: double.infinity,
            height: 100,

            child: ElevatedButton.icon(
              onPressed: () => Get.toNamed('/addUser'),
              icon: const Icon(Icons.add),
              label: const Text("Add / Register User"),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          ListOfUsersTitle(),

          Expanded(
            child: UserListWidget(
              userList: controller.users,
              onEdit: controller.editUser,
              onDelete: controller.deleteUser,
              isLoading: controller.isLoading,
            ),
          ),
        ],
      ),
    );
  }
}

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
          IconButton(
            onPressed: () => Get.toNamed('/myProfile'),
            icon: const Icon(Icons.person),
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => controller.signOut(),
          ),
        ],
      ),
      body: Column(
        children: [
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

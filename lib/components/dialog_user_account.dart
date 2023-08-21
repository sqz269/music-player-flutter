import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:tlmc_player_flutter/services/backend_client_authentication_provider.dart';

class DialogUserAccount extends StatelessWidget {
  final authProvider = Get.find<BackendClientAuthenticationProvider>();

  DialogUserAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (authProvider.isAuthenticated.value) {
          var userInfo = authProvider.userInfo.value;

          return Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.account_circle_outlined),
                  title: Text(userInfo!.name!),
                ),
                const ListTile(
                  leading: Icon(Icons.logout),
                  title: Text("Logout"),
                ),
              ],
            ),
          );
        } else {
          return Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.account_circle_outlined),
                  title: const Text("Login"),
                  onTap: () {
                    authProvider.authenticate();
                  },
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

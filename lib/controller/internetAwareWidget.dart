import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:study_hub/controller/connectivity_controller.dart';

class Internetawarewidget extends StatelessWidget {
  final Widget child;
  const Internetawarewidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final InternetController internetController = Get.put(InternetController());
    return Obx(() {
      return internetController.isConnected.value
          ? child
          : const Scaffold(
              body: Column(
                children: [Center(child: Text('No Internet Access Available'))],
              ),
            );
    });
  }
}

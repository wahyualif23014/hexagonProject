import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../service/controler.dart';
import 'add.dart';
import 'detail.dart';

class HomePage extends StatelessWidget {
  final controller = Get.put(ActivityController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Daftar Aktivitas')),
      body: Obx(() => ListView.builder(
            itemCount: controller.activities.length,
            itemBuilder: (context, index) {
              final activity = controller.activities[index];
              return ListTile(
                title: Text(activity.title),
                subtitle: Text(activity.description),
                onTap: () => Get.to(() => ActivityDetailPage(activityId: activity.id!)),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => controller.deleteActivity(activity.id!),
                ),
              );
            },
          )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Get.to(() => AddActivityPage()),
      ),
    );
  }
}

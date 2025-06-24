import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../service/controler.dart';
import '../models/hero_model.dart';

class ActivityDetailPage extends StatelessWidget {
  final String activityId;
  ActivityDetailPage({required this.activityId});

  final controller = Get.find<ActivityController>();
  final titleC = TextEditingController();
  final descC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Activity?>(
      future: controller.getById(activityId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) return Center(child: CircularProgressIndicator());
        if (!snapshot.hasData) return Center(child: Text("Data tidak ditemukan"));

        final activity = snapshot.data!;
        titleC.text = activity.title;
        descC.text = activity.description;

        return Scaffold(
          appBar: AppBar(title: Text("Detail Aktivitas")),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(controller: titleC, decoration: InputDecoration(labelText: "Judul")),
                SizedBox(height: 12),
                TextField(controller: descC, decoration: InputDecoration(labelText: "Deskripsi")),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () async {
                    await controller.updateActivity(
                      activity.id!,
                      Activity(title: titleC.text, description: descC.text),
                    );
                    Get.back();
                  },
                  child: Text("Update"),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

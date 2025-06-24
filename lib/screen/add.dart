import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../service/controler.dart';
import '../models/hero_model.dart';

class AddActivityPage extends StatelessWidget {
  final titleC = TextEditingController();
  final descC = TextEditingController();
  final controller = Get.find<ActivityController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tambah Aktivitas")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: titleC, decoration: InputDecoration(labelText: "Judul")),
            SizedBox(height: 12),
            TextField(controller: descC, decoration: InputDecoration(labelText: "Deskripsi")),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                controller.addActivity(Activity(
                  title: titleC.text,
                  description: descC.text,
                ));
                Get.back();
              },
              child: Text("Simpan"),
            )
          ],
        ),
      ),
    );
  }
}
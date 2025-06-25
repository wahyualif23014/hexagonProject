import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';
import '../models/hero_model.dart';

class ActivityController extends GetxController {
  final database = FirebaseDatabase.instance.ref("activities");
  final activities = <Activity>[].obs;

  @override
  void onInit() {
    super.onInit();
    database.onValue.listen((event) {
      final data = event.snapshot.value as Map?;
      if (data != null) {
        activities.value = data.entries.map((e) {
          final map = Map<String, dynamic>.from(e.value);
          return Activity.fromMap(map, e.key);
        }).toList();
      }
    });
  }

  Future<void> addActivity(Activity activity) async {
    await database.push().set(activity.toMap());
  }

  Future<void> updateActivity(String id, Activity activity) async {
    await database.child(id).update(activity.toMap());
  }

  Future<void> deleteActivity(String id) async {
    await database.child(id).remove();
  }

  Future<Activity?> getById(String id) async {
    final snapshot = await database.child(id).get();
    if (snapshot.exists) {
      return Activity.fromMap(Map<String, dynamic>.from(snapshot.value as Map), id);
    }
    return null;
  }
}
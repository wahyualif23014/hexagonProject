class Activity {
  String? id;
  String title;
  String description;

  Activity({this.id, required this.title, required this.description});

  factory Activity.fromMap(Map data, String id) => Activity(
        id: id,
        title: data['title'],
        description: data['description'],
      );

  Map<String, dynamic> toMap() => {
        'title': title,
        'description': description,
      };
}
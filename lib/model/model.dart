class MyData {
  final String id;
  final String name;
  final String title;

  

  MyData({
    required this.id,
    required this.name,
    required this.title,
  });

  factory MyData.fromMap(Map<String, dynamic> map, String id) {
    return MyData(
      id: id,
      name: map['name'],
      title: map['title'],
    );
  }
}

class Person {
  final String id;
  final String name;
  final String message;
  final String image;

  Person(
      {required this.id,
      required this.name,
      required this.message,
      required this.image});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
        id: json['id'],
        name: '${json['first_name']} ${json['last_name']}',
        message: json['message'],
        image: json['image']);
  }
}


class Event {
  final int id;
  // final String photo;
  final String title;
  final String description;
  final String file;

  Event({
    required this.id,
    // required this.photo,
    required this.title,
    required this.description,
    required this.file,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      // photo: json['photo'] ,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      file: json['file'] ?? '',
    );
  }
}

List<Event> data = [

  Event(

      title: 'ganesha',
      file: 'https://i.pinimg.com/236x/61/2c/dd/612cdd6470e3e8a455057b2f3e5e8f22.jpg',
      id: 1, description: ''),
];

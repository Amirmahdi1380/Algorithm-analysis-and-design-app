class Lesson {
  final int id;
  final String subject;
  final String description;
  final String handouts;
  final String videos;

  Lesson({
    required this.id,
    required this.subject,
    required this.description,
    required this.handouts,
    required this.videos,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'] as int,
      subject: json['subject'] as String,
      description: json['description'] as String,
      handouts: json['handouts'] as String,
      videos: json['videos'] as String,
    );
  }
}
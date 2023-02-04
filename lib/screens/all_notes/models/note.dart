class Note {
  final String? title;
  final String? details;
  final String? id;
  final DateTime? createdAt;

  Note({
    this.title,
    this.details,
    this.id,
    this.createdAt,
  });

  /// simple method to convert Note object to Map
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'details': details,
      'id': id,
      'createdAt': createdAt,
    };
  }

  /// named constructor
  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      title: map['title'],
      details: map['details'],
      id: map['id'],
      createdAt: map['createdAt'].toDate(),
    );
  }

  Note copyWith({
    String? title,
    String? details,
    String? id,
    DateTime? createdAt,
  }) {
    return Note(
      title: title ?? this.title,
      details: details ?? this.details,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

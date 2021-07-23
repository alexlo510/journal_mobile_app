class JournalEntry {
  int id;
  String? title;
  String? body;
  int? rating;
  DateTime? dateTime;

  JournalEntry({
    required this.id,
    this.title,
    this.body,
    this.rating,
    this.dateTime
  });

  String toString() {
    return 'ID: $id, Title: $title, Body: $body, Rating: $rating, Time: $dateTime';
  }
}
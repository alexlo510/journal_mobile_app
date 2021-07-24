class JournalEntry {
  String? title;
  String? body;
  int? rating;
  DateTime? dateTime;

  JournalEntry({
    this.title,
    this.body,
    this.rating,
    this.dateTime
  });

  String toString() {
    return 'Title: $title, Body: $body, Rating: $rating, Time: $dateTime';
  }
}
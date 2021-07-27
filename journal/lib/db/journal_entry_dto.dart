class JournalEntryDTO {
  String? title;
  String? body;
  int? rating;
  DateTime? dateTime;

  JournalEntryDTO({
    this.title,
    this.body,
    this.rating,
    this.dateTime
  });

  String toString() {
    return 'Title: $title, Body: $body, Rating: $rating, Time: $dateTime';
  }
}
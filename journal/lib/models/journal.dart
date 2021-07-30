import 'Package:journal/models/journal_entry.dart';

class Journal {
  List<JournalEntry> journalEntriesList;

  Journal({
    journalEntriesList,
  }) : journalEntriesList = journalEntriesList ?? [];

  Journal.fake() : journalEntriesList = [
    JournalEntry(
        title: 'Test Title 1',
        body: 'Test Body 1',
        rating: 1,
        dateTime: DateTime.now(),
    ),
    JournalEntry(
        title: 'Test Title 2',
        body: 'Test Body 2',
        rating: 2,
        dateTime: DateTime.now(),
    )
  ];

  Journal.empty() : journalEntriesList = [];

  get isEmpty => this.journalEntriesList.isEmpty;
  get numberOfEntries => this.journalEntriesList.length;
}
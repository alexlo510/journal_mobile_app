import 'Package:journal/models/journal_entry.dart';

class Journal {
  List<JournalEntry> journalEntriesList;

  Journal({
    journalEntriesList,
  }) : journalEntriesList = journalEntriesList ?? [];

  Journal.fake() : journalEntriesList = [
    JournalEntry(
        title: 'Test Title',
        body: 'Test Body',
        rating: 1,
    )
  ];

  get isEmpty => true; // use as test for now

}
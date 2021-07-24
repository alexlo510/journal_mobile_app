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

  Journal.empty() : journalEntriesList = [];

  get isTrue => true; // use as test for now
  get isFalse => false; // use as test for now
  get isEmpty => this.journalEntriesList.isEmpty; // use as test for now


}
import 'package:journal/db/database_manager.dart';
import 'package:journal/models/journal_entry.dart';


class JournalEntryDAO {

  static Future<List<JournalEntry>> journalEntries({required DatabaseManager databaseManager}) async{
    final journalRecords = await databaseManager.journalEntries();
    final journalEntries = journalRecords.map((record) {
      return JournalEntry(
        title: record['title'] as String,
        body: record['body'] as String,
        rating: record['rating'] as int,
        dateTime: DateTime.parse(record['date'] as String));
    }).toList();
    return journalEntries;
  }
}
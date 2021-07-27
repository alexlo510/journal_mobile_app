import 'package:sqflite/sqflite.dart';
import 'package:journal/db/journal_entry_dto.dart';

class DatabaseManager {

  static const String DATABASE_FILENAME = 'journal.sqlite3.db';
  static const String SQL_INSERT = 'INSERT INTO journal_entries(title, body, rating, date) VALUES(?, ?, ?, ?)';
  static const String SQL_SELECT = 'SELECT * FROM journal_entries';

  // delete this later and get string from a file
  static String SQL_CREATE_SCHEMA = 'CREATE TABLE IF NOT EXISTS journal_entries(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, body TEXT NOT NULL, rating INTEGER NOT NULL, date TEXT NOT NULL)';

  static DatabaseManager? _instance;

  final Database db;

  DatabaseManager._({required Database database}) : db = database;

  factory DatabaseManager.getInstance() {
    assert(_instance != null);
    return _instance as DatabaseManager;
  }

  static Future initialize() async {
    final db = await openDatabase(DATABASE_FILENAME,
      version: 1,
      onCreate: (Database db, int version) async {
        createTables(db, SQL_CREATE_SCHEMA);
      }
    );
    _instance = DatabaseManager._(database: db);
  }

  static void createTables(Database db, String sql) async {
    await db.execute(sql);
  }

  void saveJournalEntry({required JournalEntryDTO dto}){
    db.transaction((txn) async {
      await txn.rawInsert(SQL_INSERT,
        [dto.title, dto.body, dto.rating, dto.dateTime.toString()]
      ); 
    });
  }

  Future<List<Map<String, dynamic>>> journalEntries() {
    return db.rawQuery(SQL_SELECT);
  }
}
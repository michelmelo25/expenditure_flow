import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    // if _database is null we instantiate it
    _database = await initDB();
    return _database!;
  }

  initDB() async {
    String path = "lib/core/config/provider/data/expense.db";
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE User ("
          "id INTEGER PRIMARY KEY,"
          "name TEXT,"
          "email TEXT,"
          "password TEXT"
          ")");

      await db.execute("CREATE TABLE Expense ("
          "id INTEGER PRIMARY KEY,"
          "name TEXT,"
          "value REAL,"
          "dueDate TEXT,"
          "paid INTEGER"
          ")");

      await db.execute("CREATE TABLE Category ("
          "id INTEGER PRIMARY KEY,"
          "name TEXT"
          ")");

      await db.execute("CREATE TABLE ExpenseCategore ("
          "id INTEGER PRIMARY KEY,"
          "expenseId INTEGER,"
          "categoryId INTEGER"
          ")");
    });
  }
}

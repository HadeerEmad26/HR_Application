import 'package:hr/features/addRequest/data/model/add_request_model.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteHelper {
  late Database db;
  //1. create DB
  //2.create table
  //3.CRUD => create - read - update - delete

  //! initDatabase
  void intiDB() async {
    //step 1 => Create database
    db = await openDatabase(
      'addRequest.db',
      version: 1,
      onCreate: (Database db, int v) async {
        //step 2 => create table
        return await db.execute('''
        CREATE TABLE AddRequest (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        reason TEXT,
        date TEXT,
        endTime TEXT,
        startTime TEXT,
        note TEXT)
      ''').then(
              (value) => print('DB created successfully'),
        );
      },
      onOpen: (db) => print('Database opened'),
    ).then((value) => db = value);
  }

  //! insert
  Future<int> insertToDB({required AddRequestModel model}) async {
    return await db.rawInsert('''
    INSERT INTO AddRequest(reason, date, endTime, startTime, note)
    VALUES(?, ?, ?, ?,?)''', [
      model.reason,
      model.date,
      model.endTime,
      model.startTime,
      model.note
    ]);
  }

  //!get
  Future<List<Map<String, dynamic>>> getFromDB() async {
    return await db.rawQuery('SELECT * FROM AddRequest');
  }

  //! update
  Future<int> updatedDB(int id) async {
    return await db.rawUpdate('''
    UPDATE AddRequest
    SET isCompleted = ?
    WHERE id = ?
   ''', [1, id]);
  }

  //! delete
  Future<int> deleteFromDB(int id) async {
    return await db.rawDelete(
      '''DELETE FROM AddRequest WHERE id = ?''',
      [id],
    );
  }
}

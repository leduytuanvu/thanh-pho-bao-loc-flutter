// import 'package:sqflite/sqflite.dart';

// class SqfLiteStorageService {
//   late Database _database;

//   final String tableName = 'user';
//   final String columnId = 'id';
//   final String columnName = 'name';
//   final String columnEmail = 'email';
//   final String columnPassword = 'password';
//   final String columnPhone = 'phone';
//   final String columnAddress = 'address';
//   final String columnStatus = 'status';
//   final String columnImage = 'image';
//   final String columnUsername = 'username';

//   open() async {
//     _database = await openDatabase('shop2hand.db', version: 1,
//         onCreate: (Database db, int version) async {
//       await db.execute(
//         'Create table $tableName ('
//         '$columnId integer primary key autoincrement,'
//         '$columnUsername text,'
//         '$columnName text,'
//         '$columnEmail text,'
//         '$columnAddress text,'
//         '$columnPassword text,'
//         '$columnPhone text,'
//         '$columnStatus text,'
//         '$columnImage text,'
//         ')',
//       );
//     });
//   }

//   Future<bool> insert(Map<String, dynamic> data) async {
//     await open();
//     int rowID = await _database.insert(tableName, data);
//     return rowID > 0;
//   }

//   Future<List<Map>> getAll() async {
//     await open();
//     List<Map> list = await _database.query(tableName);
//     return list;
//   }

//   Future<List<Map>> getAllOrderByID() async {
//     await open();
//     List<Map> list = await _database.query(tableName, orderBy: 'id desc');
//     return list;
//   }

//   Future<Map> getOne(int id) async {
//     await open();
//     List<Map> list = await _database.query(
//       tableName,
//       where: '$columnId?',
//       whereArgs: [id],
//     );
//     return list.first;
//   }

//   Future<bool> update(int id, Map<String, dynamic> data) async {
//     await open();
//     int rowUpdate = await _database
//         .update(tableName, data, where: '$columnId = ?', whereArgs: [id]);
//     return rowUpdate > 0;
//   }

//   Future<bool> delete(int id) async {
//     await open();
//     int roleDelete = await _database
//         .delete(tableName, where: '$columnId = ?', whereArgs: [id]);
//     return roleDelete > 0;
//   }

//   Future<bool> deleteAll() async {
//     await open();
//     int rowDelete = await _database.delete(tableName);
//     return rowDelete > 0;
//   }
// }

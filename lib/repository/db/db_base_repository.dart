import 'package:competitivecauldron/database/sqllite_database_provider.dart';

class DBBaseRepository {
  Future<List<Map>> getAllRecords(String tableName) {
    return SQLiteDBProvider.instance.getAllRecords(tableName);
  }

  Future<List<Map>> getRecord(String tableName, String columnName, int id) {
    return SQLiteDBProvider.instance.getRecord(tableName, columnName, id);
  }

  Future<void> insertAll(String tableName, dynamic list) {
    return SQLiteDBProvider.instance.insertAll(tableName, list);
  }

  Future<int> updateRecord(String tableName, dynamic entity, String columnName, int id) {
    return SQLiteDBProvider.instance.updateRecord(tableName, entity, columnName, id);
  }

  Future<int> deleteRecord(String tableName, String columnName, int id) async {
    return SQLiteDBProvider.instance.deleteRecord(tableName, columnName, id);
  }

  Future<int> deleteAll(String tableName) async {
    return SQLiteDBProvider.instance.deleteAll(tableName);
  }
}

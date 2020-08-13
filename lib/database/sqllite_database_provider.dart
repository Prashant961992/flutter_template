import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String dbTableSyncPlayer = "syncPlayer";
final String dbTableSyncTeam = "syncTeam";
final String dbTableSyncChallenge = "syncChallenge";
final String dbTableSyncCategory = "syncCategory";
final String dbTableSyncChallengeState = "syncChallengeState";
final String dbTableSyncJournal = "syncJournal";
final String dbTableSyncChallengeImageService = "syncChallengeImageService";

/// SQLite Database singleton class
class SQLiteDBProvider {
  SQLiteDBProvider._();

  static final SQLiteDBProvider instance = SQLiteDBProvider._();

  static Database _database;

  /// To get database (Future option) of type Future<Database>
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  /// init DB
  initDB() async {
    return openDatabase(
      join(await getDatabasesPath(), 'competitive_cauldron.db'),
      //on create database, create table also
      onCreate: populateDb,
      // Set the version to perform database upgrades and downgrades.
      version: 1,
    );
  }

  void populateDb(Database database, int version) async {
    await createSyncPlayerTable(database, version);
    await createSyncTeamTable(database, version);
    await createSyncChallengeTable(database, version);
    await createSyncCategoryTable(database, version);
    await createSyncChallengeStateTable(database, version);
    await createSyncJournalTable(database, version);
    await createSyncChallengeImageServiceTable(database, version);
  }

  Future createSyncPlayerTable(Database database, int version) async {
    await database.execute("CREATE TABLE $dbTableSyncPlayer("
        "PlayerID TEXT PRIMARY KEY, "
        "TeamID TEXT, "
        "Jersey TEXT,"
        "LastName TEXT,"
        "FirstName TEXT,"
        "Grade TEXT,"
        "Position TEXT,"
        "BirthDate TEXT,"
        "GraduationDate TEXT,"
        "visible TEXT,"
        "PEmail TEXT,"
        "EmailPRpt TEXT,"
        "MEmail TEXT,"
        "EmailMRpt TEXT,"
        "DEmail TEXT,"
        "EmailDRpt TEXT,"
        "Phone1 TEXT,"
        "Notes TEXT,"
        "join_Date TEXT,"
        "UserName TEXT,"
        "Password TEXT,"
        "type_id TEXT,"
        "Photo TEXT,"
        "modified TEXT,"
        "UserLevel TEXT)");
  }

  Future createSyncTeamTable(Database database, int version) async {
    await database.execute("CREATE TABLE $dbTableSyncTeam("
        "TeamID TEXT PRIMARY KEY, "
        "Sport TEXT, "
        "Stats_Year TEXT,"
        "Team_Name TEXT,"
        "Team_Desc1 TEXT,"
        "Notes TEXT,"
        "rptFitness TEXT,"
        "SeasonStart TEXT,"
        "SeasonEnd TEXT,"
        "subscription_end TEXT,"
        "Bulk_Import TEXT,"
        "show_report_to_player TEXT,"
        "showbest TEXT,"
        "showworst TEXT,"
        "showlegend TEXT,"
        "Team_Picture TEXT,"
        "Attendance_Multiplier TEXT,"
        "Display_Picture TEXT,"
        "modified TEXT,"
        "quote TEXT,"
        "noofmonth TEXT,"
        "team_position TEXT,"
        "showAttdRank TEXT,"
        "birthdayAlert TEXT,"
        "sendBirthdayAlert TEXT,"
        "currently_running TEXT,"
        "selected_hr TEXT,"
        "run_only_once TEXT,"
        "selected_hr_op TEXT,"
        "selected_min TEXT,"
        "selected_option TEXT,"
        "selected_week TEXT,"
        "date_of_month TEXT,"
        "fire_time TEXT,"
        "time_interval TEXT,"
        "time_last_fired TEXT,"
        "schedule_email TEXT,"
        "master_content TEXT,"
        "team_content TEXT,"
        "email_login TEXT,"
        "email_auditlog TEXT,"
        "email_journal TEXT,"
        "show_all_players TEXT,"
        "admin_name TEXT,"
        "admin_pw TEXT,"
        "admin_email TEXT,"
        "contact_name TEXT,"
        "contact_address TEXT,"
        "contact_city TEXT,"
        "contact_state TEXT,"
        "contact_zip TEXT,"
        "contact_phone TEXT,"
        "contact_email TEXT,"
        "trial TEXT,"
        "Activated TEXT,"
        "demoTeam TEXT,"
        "type_id TEXT,"
        "email_ranking TEXT,"
        "isSubscribe INTEGER,"
        "time_of_day TEXT,"
        "day_of_week TEXT,"
        "Website_Logo TEXT,"
        "Team_Desc2 TEXT,"
        "Team_Desc3 TEXT,"
        "EmailAdminRpt TEXT,"
        "mgr_name TEXT,"
        "mgr_pw TEXT,"
        "mgr_email TEXT,"
        "EmailMgrRpt TEXT,"
        "Desc1 TEXT,"
        "Desc2 TEXT,"
        "Desc3 TEXT,"
        "Email1 TEXT,"
        "Email2 TEXT,"
        "Email3 TEXT,"
        "EmailDesc1Rpt TEXT,"
        "EmailDesc2Rpt TEXT,"
        "EmailDesc3Rpt TEXT,"
        "UserLevel TEXT)");
  }

  Future createSyncChallengeTable(Database database, int version) async {
    await database.execute("CREATE TABLE $dbTableSyncChallenge("
        "ID TEXT PRIMARY KEY, "
        "TeamID TEXT, "
        "Challenge_Name TEXT,"
        "Challenge_Menu TEXT,"
        "Challenge_Text1 TEXT,"
        "Challenge_Text2 TEXT,"
        "Challenge_Text3 TEXT,"
        "Challenge_Multiplier TEXT,"
        "Challenge_Type TEXT,"
        "Challenge_Exclude TEXT,"
        "Challenge_Category TEXT,"
        "Challenge_Desc TEXT,"
        "Show_Ties TEXT,"
        "Challenge_Pic TEXT,"
        "isDecimal TEXT,"
        "topPerformer TEXT,"
        "Enabled TEXT,"
        "isHome TEXT,"
        "isAdding TEXT,"
        "standard0 TEXT,"
        "Fitness_Rpt TEXT,"
        "Stats_exist TEXT,"
        "RankFormula TEXT,"
        "Rorder TEXT,"
        "isAvg TEXT,"
        "fields TEXT,"
        "playerCount TEXT)");
  }

  Future createSyncCategoryTable(Database database, int version) async {
    await database.execute("CREATE TABLE $dbTableSyncCategory("
        "id TEXT PRIMARY KEY, "
        "TeamID TEXT, "
        "categoryname TEXT,"
        "shortname TEXT,"
        "catOrder TEXT)");
  }

  Future createSyncChallengeStateTable(Database database, int version) async {
    await database.execute("CREATE TABLE $dbTableSyncChallengeState("
        "ID TEXT PRIMARY KEY, "
        "ChallengeID TEXT, "
        "TeamID TEXT,"
        "PlayerID TEXT,"
        "column_val TEXT,"
        "Date TEXT,"
        "column_name TEXT)");
  }

  Future createSyncJournalTable(Database database, int version) async {
    await database.execute("CREATE TABLE $dbTableSyncJournal("
        "id TEXT PRIMARY KEY, "
        "TeamID TEXT, "
        "PlayerID TEXT,"
        "player_name TEXT,"
        "notes TEXT,"
        "add_date TEXT)");
  }

  Future createSyncChallengeImageServiceTable(Database database, int version) async {
    await database.execute("CREATE TABLE $dbTableSyncChallengeImageService("
        "challengeID TEXT PRIMARY KEY, "
        "imgData TEXT)");
  }

  /// To insert all records in database table
  Future<void> insertAll(String tableName, dynamic entity) async {
    entity.forEach((element) {
      insertRecord(tableName, element);
    });
  }

  /// To insert single record in database table
  Future<void> insertRecord(String tableName, dynamic entity) async {
    // Get a reference to the database.
    final Database db = await database;

    // You might also specify the
    // `conflictAlgorithm` to use in case the same entity is inserted twice.
    // In this case, replace any previous data.

    db.transaction((txn) async {
      await txn.insert(tableName, entity.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    });
  }

  /// To get all records from database table
  Future<List<Map>> getAllRecords(String tableName) async {
    final db = await database;
//    List<Map> results = await db.query(tableName, orderBy: "id ASC");
    List<Map> results = await db.query(tableName);
    return results;
  }

  /// To get single record from database table
  Future<List<Map>> getRecord(
      String tableName, String columnName, int id) async {
    final db = await database;
    List<Map> results = await db
        .rawQuery('SELECT * FROM $tableName WHERE $columnName = ?', ['$id']);
    return results;
  }

  /// To update record in database table
  Future<int> updateRecord(
      String tableName, dynamic entity, String columnName, int id) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given entity
    var result = await db.update(
      tableName,
      entity.toJson(),
      where: "$columnName = ?",
      // Pass the entity's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
    return result;
  }

  /// To delete record from database table
  Future<int> deleteRecord(String tableName, String columnName, int id) async {
    // Get a reference to the database.
    final db = await database;

    var result = await db.delete(
      tableName,
      where: "$columnName = ?",
      // Pass the entity's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
    return result;
  }

  /// To delete all records from database table
  Future<int> deleteAll(String tableName) async {
    // Get a reference to the database.
    final db = await database;

    var result = await db.delete(tableName);
    return result;
  }
}

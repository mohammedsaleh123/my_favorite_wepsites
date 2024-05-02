import 'package:my_favorite_wepsites/features/sections/data/models/sections_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalSectionsDataSource {
  late Database db;

  Future openSections() async {
    final path = join(await getDatabasesPath(), SectionsFields.database);
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
        create table ${SectionsFields.table} ( 
        ${SectionsFields.id} integer primary key autoincrement,
        ${SectionsFields.categoryId} integer,
        ${SectionsFields.sectionName} text,
        ${SectionsFields.sectionDescription} text,
        ${SectionsFields.url} text)
      ''');
    });
  }

  Future<Sections> insert(Sections favorite) async {
    favorite.id = await db.insert(SectionsFields.table, favorite.toMap());
    return favorite;
  }

  Future<List<Map<String, dynamic>>> getAllFavorites() async {
    final maps = await db.query(SectionsFields.table,
        columns: SectionsFields.getFields());
    return maps;
  }

  Future<int> delete(int id) async {
    return await db.delete(
      SectionsFields.table,
      where: '${SectionsFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future<int> update(Map<String, dynamic> favorite) async {
    try {
      return await db.update(SectionsFields.table, favorite,
          where: '${SectionsFields.id} = ?', whereArgs: [favorite['id']]);
    } on Exception catch (e) {
      throw Exception('Failed to update note from database : $e');
    }
  }
}
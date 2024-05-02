import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/categories_model.dart';

class LocalCategoriesDataSource {
  late Database db;

  Future openCategories() async {
    final path = join(await getDatabasesPath(), CategoriesFields.database);
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
        create table ${CategoriesFields.table} ( 
        ${CategoriesFields.id} integer primary key autoincrement, 
        ${CategoriesFields.categoryName} text,
        ${CategoriesFields.categoryDescription} text)
      ''');
    });
  }

  Future<CategoriesModel> insert(CategoriesModel favorite) async {
    favorite.id = await db.insert(CategoriesFields.table, favorite.toMap());
    return favorite;
  }

  Future<List<Map<String, dynamic>>> getAllFavorites() async {
    final maps = await db.query(CategoriesFields.table,
        columns: CategoriesFields.getFields());
    return maps;
  }

  Future<int> delete(int id) async {
    return await db.delete(
      CategoriesFields.table,
      where: '${CategoriesFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future<int> update(Map<String, dynamic> favorite) async {
    try {
      return await db.update(CategoriesFields.table, favorite,
          where: '${CategoriesFields.id} = ?', whereArgs: [favorite['id']]);
    } on Exception catch (e) {
      throw Exception('Failed to update note from database : $e');
    }
  }
}

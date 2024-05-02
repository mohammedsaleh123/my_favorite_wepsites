import 'package:my_favorite_wepsites/core/servies_locator/servies_locator.dart';
import 'package:my_favorite_wepsites/features/categories_home/data/models/categories_model.dart';
import 'package:my_favorite_wepsites/features/categories_home/data/resources/local_categories_data_source.dart';

class LocalDataRepo {
  LocalCategoriesDataSource localDataSource = sl<LocalCategoriesDataSource>();

  Future<void> openCategories() async {
    await localDataSource.openCategories();
  }

  Future<List<CategoriesModel>> getAllFavorites() async {
    final result = await localDataSource.getAllFavorites();
    return result.map((e) => CategoriesModel.fromMap(e)).toList();
  }

  Future<CategoriesModel> insert(CategoriesModel favorite) async {
    return await localDataSource.insert(favorite);
  }

  Future<int> delete(int id) async {
    return await localDataSource.delete(id);
  }

  Future<int> update(CategoriesModel favorite) async {
    return await localDataSource.update(favorite.toMap());
  }
}

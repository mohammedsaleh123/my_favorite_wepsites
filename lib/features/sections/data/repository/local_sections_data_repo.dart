import 'package:my_favorite_wepsites/core/servies_locator/servies_locator.dart';
import 'package:my_favorite_wepsites/features/sections/data/models/sections_model.dart';

import '../resources/local_sections_data_source.dart';

class LocalSectionsDataRepo {
  LocalSectionsDataSource localSectionsDataSource = sl<LocalSectionsDataSource>();

  Future<void> openSections() async {
    await localSectionsDataSource.openSections();
  }

  Future<List<Sections>> getAllSections() async {
    final result = await localSectionsDataSource.getAllFavorites();
    return result.map((e) => Sections.fromMap(e)).toList();
  }

  Future<Sections> insert(Sections favorite) async {
    return await localSectionsDataSource.insert(favorite);
  }

  Future<int> delete(int id) async {
    return await localSectionsDataSource.delete(id);
  }

  Future<int> update(Sections favorite) async {
    return await localSectionsDataSource.update(favorite.toMap());
  }


}
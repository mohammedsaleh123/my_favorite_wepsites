import 'package:get_it/get_it.dart';
import 'package:my_favorite_wepsites/features/categories_home/data/repository/local_data_repo.dart';
import 'package:my_favorite_wepsites/features/categories_home/data/resources/local_categories_data_source.dart';

import '../../features/categories_home/presentation/bussines_logic/cubit/categories_cubit.dart';
import '../../features/sections/data/repository/get_url_repo.dart';
import '../../features/sections/data/repository/local_sections_data_repo.dart';
import '../../features/sections/data/resources/get_url_fivicon_service.dart';
import '../../features/sections/data/resources/local_sections_data_source.dart';
import '../../features/sections/presentation/bussines_logic/sections_cubit/sections_cubit.dart';

late GetIt sl;
void setupLocator() {
  sl = GetIt.instance;

  //services
  sl.registerSingleton(LocalCategoriesDataSource());
  sl.registerSingleton(GetUrlFivIconService());
  sl.registerSingleton(LocalSectionsDataSource());

  //repository
  sl.registerSingleton(GetUrlRepo());
  sl.registerSingleton(LocalDataRepo());
  sl.registerSingleton(LocalSectionsDataRepo());

  //bloc
  sl.registerFactory<CategoriesCubit>(() => CategoriesCubit());
  sl.registerFactory<SectionsCubit>(() => SectionsCubit());
}

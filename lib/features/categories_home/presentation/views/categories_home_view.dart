import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_favorite_wepsites/features/categories_home/data/models/categories_model.dart';
import 'package:my_favorite_wepsites/features/categories_home/presentation/bussines_logic/cubit/categories_cubit.dart';
import 'package:my_favorite_wepsites/features/sections/presentation/views/sections_view.dart';

import 'widgets/add_category_dialog.dart';
import 'widgets/delete_category_dialog.dart';

class CategotiesHomeView extends StatefulWidget {
  const CategotiesHomeView({super.key});

  @override
  State<CategotiesHomeView> createState() => _CategotiesHomeViewState();
}

class _CategotiesHomeViewState extends State<CategotiesHomeView> {
  @override
  void initState() {
     BlocProvider.of<CategoriesCubit>(context).openCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesCubit, CategoriesState>(
      listener: (context, state) {},
      builder: (context, state) {
        CategoriesCubit cubit = BlocProvider.of<CategoriesCubit>(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Book Mark Categories'),
          ),
          body: Center(
            child: Column(
              children: [
                FutureBuilder<List<CategoriesModel>>(
                  future: cubit.getCategories(),
                  builder: (context, snapshot) {
                    // if (snapshot.connectionState == ConnectionState.waiting) {
                    //   return const Center(
                    //     child: CircularProgressIndicator(),
                    //   );
                    // }
                    if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    }
                    final data = snapshot.data ?? [];
                    return Expanded(
                      child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          CategoriesModel category = data[index];
                          return InkWell(
                            onLongPress: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: DeleteCategoryDialog(
                                        cubit: cubit, category: category),
                                  );
                                },
                              );
                            },
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      SectionsView(category: category),
                                ),
                              );
                            },
                            child: Card(
                              child: ListTile(
                                  title: Text(
                                    category.categoryName,
                                    style: TextStyle(
                                        fontSize: 20.sp, color: Colors.black),
                                  ),
                                  subtitle: Text(
                                    category.categoryDescription!,
                                  )),
                            ),
                          );
                        },
                      ),
                    );
                  },
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: AddCategoryDialog(cubit: cubit),
                  );
                },
              );
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}

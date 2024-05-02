import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/categories_model.dart';
import '../../bussines_logic/cubit/categories_cubit.dart';

class DeleteCategoryDialog extends StatelessWidget {
  const DeleteCategoryDialog({
    super.key,
    required this.cubit,
    required this.category,
  });

  final CategoriesCubit cubit;
  final CategoriesModel category;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200.h,
        width: double.infinity,
        child: Column(
            mainAxisAlignment:
                MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Delete Category'),
              Row(
                  mainAxisAlignment:
                      MainAxisAlignment
                          .spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(
                            context);
                      },
                      child: const Text(
                          'Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        cubit
                            .deleteCategories(
                                category.id!);
                        Navigator.pop(
                            context);
                      },
                      child: const Text(
                          'Delete'),
                    )
                  ],),
            ],),);
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/custom_text_field.dart';
import '../../bussines_logic/cubit/categories_cubit.dart';

class AddCategoryDialog extends StatelessWidget {
  const AddCategoryDialog({
    super.key,
    required this.cubit,
  });

  final CategoriesCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text('Add New Category'),
          CustomTextField(
            hintText: 'Add Category Name',
            textController: cubit.categoryNameController,
          ),
          CustomTextField(
            hintText: 'Add Category Description',
            textController: cubit.categoryDescriptionController,
          ),
          ElevatedButton(
            onPressed: () {
              cubit.insertCategories();
              if (context.mounted) {
                Navigator.pop(context);
              }
            },
            child: const Text('Add'),
          )
        ],
      ),
    );
  }
}

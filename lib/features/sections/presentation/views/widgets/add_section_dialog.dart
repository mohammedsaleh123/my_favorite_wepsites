import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../categories_home/data/models/categories_model.dart';
import '../../bussines_logic/sections_cubit/sections_cubit.dart';

class AddSectionDialog extends StatelessWidget {
  const AddSectionDialog({
    super.key,
    required this.sectionCubit,
    required this.category,
  });

  final SectionsCubit sectionCubit;
  final CategoriesModel category;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 300.h,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('Add Section'),
            CustomTextField(
              hintText: 'Enter Section Name',
              textController: sectionCubit.nameSectionController,
            ),
            CustomTextField(
              hintText: 'Enter Section Description',
              textController:
                  sectionCubit.descriptionSectionController,
            ),
            CustomTextField(
              hintText: 'Enter Section Url',
              textController: sectionCubit.urlSectionController,
            ),
            ElevatedButton(
              onPressed: () async {
                await sectionCubit.insertSection(category.id!);
                if(context.mounted){
                  Navigator.pop(context);
                }
              },
              child: const Text('Add'),
            )
          ],
        ),
      ),
    );
  }
}

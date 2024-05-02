import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_favorite_wepsites/features/sections/data/models/sections_model.dart';
import 'package:my_favorite_wepsites/features/sections/presentation/bussines_logic/sections_cubit/sections_cubit.dart';

// ignore: must_be_immutable
class DeleteSectionDialog extends StatelessWidget {
   DeleteSectionDialog({
    super.key,
    required this.cubit,
    required this.sections,
  });

  final SectionsCubit cubit;
  Sections sections;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text('Delete Category'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  cubit.deleteSection(sections.id!);
                  Navigator.pop(context);
                },
                child: const Text('Delete'),
              )
            ],
          ),
        ],
      ),
    );
  }
}

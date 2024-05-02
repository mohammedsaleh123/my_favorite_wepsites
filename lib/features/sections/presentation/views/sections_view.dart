
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_favorite_wepsites/features/categories_home/data/models/categories_model.dart';
import 'package:my_favorite_wepsites/features/sections/data/models/sections_model.dart';
import 'package:my_favorite_wepsites/features/sections/presentation/bussines_logic/sections_cubit/sections_cubit.dart';

import 'widgets/add_section_dialog.dart';
import 'widgets/list_sections.dart';

// ignore: must_be_immutable
class SectionsView extends StatefulWidget {
  SectionsView({super.key, required this.category});
  CategoriesModel category;

  @override
  State<SectionsView> createState() => _SectionsViewState();
}

class _SectionsViewState extends State<SectionsView> {
  @override
  void initState() {
    BlocProvider.of<SectionsCubit>(context).openSections();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SectionsCubit>(context).openSections();
    return BlocConsumer<SectionsCubit, SectionsState>(
      listener: (context, state) {},
      builder: (context, state) {
        final sectionCubit = BlocProvider.of<SectionsCubit>(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.category.categoryName),
          ),
          body: Center(
            child: FutureBuilder<List<Sections>>(
                future: sectionCubit.getSections(),
                builder: (context, snapshot) {
                  // if (snapshot.connectionState == ConnectionState.waiting) {
                  //   return const Center(child: CircularProgressIndicator());
                  // }
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  List<Sections> data = snapshot.data == null
                      ? []
                      : snapshot.data!
                          .where((element) =>
                              element.categoryId == widget.category.id)
                          .toList();
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            Sections sections = data[index];
                            return ListSections(sections: sections);
                          },
                        ),
                      ),
                    ],
                  );
                }),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AddSectionDialog(
                  sectionCubit: sectionCubit,
                  category: widget.category,
                ),
              );
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}



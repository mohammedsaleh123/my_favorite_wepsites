import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_favorite_wepsites/features/sections/data/models/sections_model.dart';
import 'package:my_favorite_wepsites/features/sections/data/repository/get_url_repo.dart';
import 'package:my_favorite_wepsites/features/sections/data/repository/local_sections_data_repo.dart';

import '../../../../../core/servies_locator/servies_locator.dart';

part 'sections_state.dart';

class SectionsCubit extends Cubit<SectionsState> {
  SectionsCubit() : super(SectionsInitial());
  LocalSectionsDataRepo localSectionsDataRepo = sl<LocalSectionsDataRepo>();
  GetUrlRepo getUrlRepo = sl<GetUrlRepo>();
  TextEditingController nameSectionController = TextEditingController();
  TextEditingController descriptionSectionController = TextEditingController();
  TextEditingController urlSectionController = TextEditingController();

  Future<void> openSections() async {
    await localSectionsDataRepo.openSections();
    emit(OpenSection());
  }

  Future<List<Sections>> getSections() async {
    emit(GetSectionsLoading());
    try {
      final result = await localSectionsDataRepo.getAllSections();
      emit(GetSectionsSuccess());
      return result;
    } on Exception catch (e) {
      emit(GetSectionsError(error: e.toString()));
      throw Exception(e);
    }
  }

  Future<void> insertSection(int categoryId) async {
    emit(InsertSectionLoading());
    try {
      await localSectionsDataRepo.insert(
        Sections(
          categoryId: categoryId,
          sectionName: nameSectionController.text,
          sectionDescription: descriptionSectionController.text,
          url: urlSectionController.text,
        ),
      );
      emit(InsertSectionSuccess());
      nameSectionController.clear();
      descriptionSectionController.clear();
      urlSectionController.clear();
    } on Exception catch (e) {
      emit(InsertSectionError(error: e.toString()));
      throw Exception(e);
    }
  }

  Future<void> updateSection(int id) async {
    emit(UpdateSectionLoading());
    try {
      await localSectionsDataRepo.update(
        Sections(
          categoryId: id,
          sectionName: nameSectionController.text,
          sectionDescription: descriptionSectionController.text,
          url: urlSectionController.text,
        ),
      );
      emit(UpdateSectionSuccess());
    } on Exception catch (e) {
      emit(UpdateSectionError(error: e.toString()));
      throw Exception(e);
    }
  }

  Future<void> deleteSection(int id) async {
    emit(DeleteSectionLoading());
    try {
      await localSectionsDataRepo.delete(id);
      emit(DeleteSectionSuccess());
    } on Exception catch (e) {
      emit(DeleteSectionError(error: e.toString()));
      throw Exception(e);
    }
  }

  void getUrlImage(String websiteUrl) {
    emit(GetUrlImageLoading());
    getUrlRepo.getUrlImage(websiteUrl).then((value) {
      if (value != null) {
        emit(GetUrlImageSuccess());
      }
    }).catchError((e) {
      emit(GetUrlImageError(error: e.toString()));
    });
  }
}

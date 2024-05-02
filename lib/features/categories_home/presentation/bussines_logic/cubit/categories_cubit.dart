import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_favorite_wepsites/core/servies_locator/servies_locator.dart';
import 'package:my_favorite_wepsites/features/categories_home/data/repository/local_data_repo.dart';

import '../../../data/models/categories_model.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());

  LocalDataRepo localDataRepo = sl<LocalDataRepo>();
  TextEditingController categoryNameController = TextEditingController();
  TextEditingController categoryDescriptionController = TextEditingController();
  TextEditingController updateCategoryNameController = TextEditingController();
  TextEditingController updateCategoryDescriptionController =
      TextEditingController();

  Future<void> openCategories() async {
    await localDataRepo.openCategories();
    emit(CategoriesInitial());
  }

  Future<void> insertCategories() async {
    emit(InsertCategoriesLoading());
    try {
      await localDataRepo.insert(
        CategoriesModel(
          categoryName: categoryNameController.text,
          categoryDescription: categoryDescriptionController.text,
        ),
      );
      emit(InsertCategoriesSuccess());
      getCategories();
      categoryNameController.clear();
      categoryDescriptionController.clear();
    } catch (e) {
      emit(InsertCategoriesError(message: e.toString()));
    }
  }

  Future<void> updateCategories(int id) async {
    emit(UpdateCategoriesLoading());
    await localDataRepo
        .update(
      CategoriesModel(
        categoryName: updateCategoryNameController.text,
        categoryDescription: updateCategoryDescriptionController.text,
      ),
    )
        .then((value) {
      emit(UpdateCategoriesSuccess());
      getCategories();
    }).catchError((e) {
      emit(UpdateCategoriesError(message: e.toString()));
    });
  }

  Future<void> deleteCategories(int id) async {
    emit(DeleteCategoriesLoading());
    await localDataRepo.delete(id).then((value) {
      emit(DeleteCategoriesSuccess());
      getCategories();
    }).catchError((e) {
      emit(DeleteCategoriesError(message: e.toString()));
    });
  }

  Future<List<CategoriesModel>> getCategories() async {
    emit(GetCategoriesLoading());
    try {
      List<CategoriesModel> result =
          await localDataRepo.getAllFavorites().then((value) {
        emit(GetCategoriesSuccess());
        return value;
      });
      emit(GetCategoriesSuccess());
      return result;
    } catch (e) {
      emit(GetCategoriesError(message: e.toString()));
      return [];
    }
  }
}

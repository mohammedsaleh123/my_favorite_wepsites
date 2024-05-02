part of 'categories_cubit.dart';

sealed class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

final class OpenCategories extends CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class GetCategoriesLoading extends CategoriesState {}

final class GetCategoriesSuccess extends CategoriesState {}

final class GetCategoriesError extends CategoriesState {
  final String message;
  const GetCategoriesError({required this.message});
}

final class InsertCategoriesLoading extends CategoriesState {}

final class InsertCategoriesSuccess extends CategoriesState {}

final class InsertCategoriesError extends CategoriesState {
  final String message;
  const InsertCategoriesError({required this.message});
}

final class DeleteCategoriesLoading extends CategoriesState {}

final class DeleteCategoriesSuccess extends CategoriesState {}

final class DeleteCategoriesError extends CategoriesState {
  final String message;
  const DeleteCategoriesError({required this.message});
}

final class UpdateCategoriesLoading extends CategoriesState {}

final class UpdateCategoriesSuccess extends CategoriesState {}

final class UpdateCategoriesError extends CategoriesState {
  final String message;
  const UpdateCategoriesError({required this.message});
}

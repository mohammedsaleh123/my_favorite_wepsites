part of 'sections_cubit.dart';

sealed class SectionsState extends Equatable {
  const SectionsState();

  @override
  List<Object> get props => [];
}

final class SectionsInitial extends SectionsState {}

final class OpenSection extends SectionsState {}

final class GetSectionsLoading extends SectionsState {}

final class GetSectionsSuccess extends SectionsState {}

final class GetSectionsError extends SectionsState {
  final String error;
  const GetSectionsError({required this.error});
}

final class InsertSectionLoading extends SectionsState {}

final class InsertSectionSuccess extends SectionsState {}

final class InsertSectionError extends SectionsState {
  final String error;
  const InsertSectionError({required this.error});
}

final class UpdateSectionLoading extends SectionsState {}

final class UpdateSectionSuccess extends SectionsState {}

final class UpdateSectionError extends SectionsState {
  final String error;
  const UpdateSectionError({required this.error});
}

final class DeleteSectionLoading extends SectionsState {}

final class DeleteSectionSuccess extends SectionsState {}

final class DeleteSectionError extends SectionsState {
  final String error;
  const DeleteSectionError({required this.error});
}

final class GetUrlImageLoading extends SectionsState {}

final class GetUrlImageSuccess extends SectionsState {}

final class GetUrlImageError extends SectionsState {
  final String error;
  const GetUrlImageError({required this.error});
}

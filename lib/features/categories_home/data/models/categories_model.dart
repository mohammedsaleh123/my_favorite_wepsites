class CategoriesFields {
  static const String table = 'Categories';
  static const String database = 'favorite.db';
  static const String id = 'id';
  static const String categoryName = 'categoryName';
  static const String categoryDescription = 'categoryDescription';
  static List<String> getFields() => [id, categoryName, categoryDescription];
}

class CategoriesModel {
   int? id;
  final String categoryName;
  final String? categoryDescription;

  CategoriesModel({
    this.id,
    required this.categoryName,
    this.categoryDescription,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'categoryName': categoryName,
      'categoryDescription': categoryDescription,
    };
  }

  factory CategoriesModel.fromMap(Map<String, dynamic> map) {
    return CategoriesModel(
      id: map['id'] as int,
      categoryName: map['categoryName'] as String,
      categoryDescription: map['categoryDescription'] != null
          ? map['categoryDescription'] as String
          : null,
    );
  }
}

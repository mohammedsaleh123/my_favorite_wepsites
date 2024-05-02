class SectionsFields {
  static const String table = 'Sections';
  static const String database = 'sections.db';
  static const String id = 'id';
  static const String categoryId = 'categoryId';
  static const String sectionName = 'sectionName';
  static const String sectionDescription = 'sectionDescription';
  static const String url = 'url';
  static List<String> getFields() =>
      [id, categoryId, sectionName, sectionDescription, url];
}

class Sections {
  int? id;
  final int categoryId;
  final String sectionName;
  final String? sectionDescription;
  final String url;

  Sections(
      {this.id,
      required this.categoryId,
      required this.sectionName,
      required this.sectionDescription,
      required this.url});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'categoryId': categoryId,
      'sectionName': sectionName,
      'sectionDescription': sectionDescription,
      'url': url,
    };
  }

  factory Sections.fromMap(Map<String, dynamic> map) {
    return Sections(
      id: map['id'] as int,
      categoryId: map['categoryId'] as int,
      sectionName: map['sectionName'] as String,
      sectionDescription: map['sectionDescription'] != null
          ? map['sectionDescription'] as String
          : null,
      url: map['url'] as String,
    );
  }
}

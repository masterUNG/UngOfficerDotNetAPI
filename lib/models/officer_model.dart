import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class OfficerModel {
  final int id;
  final String name;
  final String surname;
  final String position;
  OfficerModel({
    required this.id,
    required this.name,
    required this.surname,
    required this.position,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'surname': surname,
      'position': position,
    };
  }

  factory OfficerModel.fromMap(Map<String, dynamic> map) {
    return OfficerModel(
      id: (map['id'] ?? 0) as int,
      name: (map['name'] ?? '') as String,
      surname: (map['surname'] ?? '') as String,
      position: (map['position'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OfficerModel.fromJson(String source) => OfficerModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

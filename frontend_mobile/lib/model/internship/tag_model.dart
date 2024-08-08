import 'dart:convert';

Tag tagFromMap(String str) => Tag.fromMap(json.decode(str));

String tagToMap(Tag data) => json.encode(data.toMap());

class Tag {
    int id;
    String name;

    Tag({
        required this.id,
        required this.name,
    });

    factory Tag.fromMap(Map<String, dynamic> json) => Tag(
        id: json["id"] as int,
        name: json["name"] as String,
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
    };
}
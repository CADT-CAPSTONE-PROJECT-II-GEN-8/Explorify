class Post {
  int postId;
  dynamic author;
  String title;
  String content;
  String slug;
  DateTime createdAt;
  DateTime updatedAt;
  List<dynamic> tags;

  Post({
    required this.postId,
    required this.author,
    required this.title,
    required this.content,
    required this.slug,
    required this.createdAt,
    required this.updatedAt,
    required this.tags,
  });

  factory Post.fromMap(Map<String, dynamic> json) => Post(
        postId: json["post_id"],
        author: json["author"],
        title: json["title"],
        content: json["content"],
        slug: json["slug"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "post_id": postId,
        "author": author,
        "title": title,
        "content": content,
        "slug": slug,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "tags": List<dynamic>.from(tags.map((x) => x)),
      };
}

class Post {
  final String? id;
  final String? userId;
  final String? title;
  final String? body;

  Post({this.id, this.userId, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        id: json["id"].toString(),
        userId: json["userId"].toString(),
        title: json["title"],
        body: json["body"]);
  }
}

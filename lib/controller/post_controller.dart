import 'dart:async';
import 'dart:convert';
import '../models/post.dart';
import 'package:http/http.dart' as http;

class PostController {
  final _postController = StreamController<List<Post>>.broadcast();

  Stream<List<Post>> get postStream => _postController.stream;

  Future<void> FetchPosts() async {
    try {
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        final List<Post> posts =
            jsonData.map((data) => Post.fromJson(data)).toList();
        _postController.sink.add(posts);
      } else {
        throw Exception("failed to data Post");
      }
    } catch (e) {
      _postController.addError(e);
    }
  }

  void dispose() {
    _postController.close();
  }
}

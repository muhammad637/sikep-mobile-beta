import 'package:flutter/material.dart';
import 'package:flutter_testing/controller/post_controller.dart';
import '../models/post.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  final PostController _controller = PostController();

  @override
  void initState() {
    super.initState();
    _controller.FetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('belajar API'),
      ),
      body: _buildBody(controller: _controller),
    );
  }
}

class _buildBody extends StatelessWidget {
  const _buildBody({
    super.key,
    required PostController controller,
  }) : _controller = controller;

  final PostController _controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: Text("appbar body"),
        ),
        Expanded(
          flex: 8,
          child: StreamBuilder(
            stream: _controller.postStream,
            builder: (context, AsyncSnapshot<List<Post>> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(),
                    title: Text("titile : ${snapshot.data![index].title}"),
                    subtitle: Text("${snapshot.data![index].body}"),
                  ),
                  itemCount: snapshot.data!.length,
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error ${snapshot.error}'),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        )
      ],
    );
  }
}

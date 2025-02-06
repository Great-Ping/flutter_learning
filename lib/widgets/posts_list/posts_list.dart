import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/entities/posts/post_details.dart';
import '../../features/widget.dart';

class PostsList extends StatefulWidget {
  const PostsList({
    required this.posts,
    super.key
  });

  final List<PostDetails> posts;

  @override
  State<PostsList> createState() => PostsListState();
}

class PostsListState extends State<PostsList> {

  @override
  Widget build(BuildContext context) {
    var children =  widget.posts.map((channel){
      return PostCard(
          post: channel
      );
    }).toList();

    return ListView.builder(
      padding: const EdgeInsets.only(top: 10),
      itemCount: children.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: children[index]
        );
      },
    );
  }
}
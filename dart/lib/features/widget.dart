import 'package:flutter/material.dart';
import 'package:fckupFlutter/app/theme/theme_data.dart';
import 'package:fckupFlutter/entities/posts/post_details.dart';
import 'package:fckupFlutter/pages/post_details/widget.dart';
import 'package:go_router/go_router.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    required this.post,
    super.key
  });
  final PostDetails post;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PostDetailsPage(
              postId: post.id,
              postDesc: post.description,
          ))
        );
      },
      child: Container(
          decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(
                  Radius.circular(20)
              )
          ),
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Expanded (
                  child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0
                      ),
                      child:Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 28.0
                              ),
                              overflow: TextOverflow.fade,
                              post.name,
                            )
                          ]
                      )
                  )
              )
          )
      ),
    );
  }
}
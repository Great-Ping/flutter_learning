import 'package:flutter/cupertino.dart';
import 'package:fckupFlutter/entities/posts/post_details.dart';

class PostDetailsWidget extends StatelessWidget {
  final PostDetails postDetails;

  const PostDetailsWidget({
    required this.postDetails,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
            postDetails.name
        ),
        const Text(
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600
          ),
          "Описание"
        ),
        Text(
            postDetails.description
        ),
      ],
    );
  }

}
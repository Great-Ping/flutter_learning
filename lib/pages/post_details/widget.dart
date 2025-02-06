import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/entities/posts/post_details.dart';
import 'package:flutter_learning/shared/ui/width_wrapper/width_wrapper.dart';
import 'package:http/http.dart';


PostDetails parsePost(String responseBody) {
  final parsed = jsonDecode(responseBody);

  return PostDetails(
      id: parsed["id"] as int,
      name: parsed["body"] as String,
      description: parsed["body"] as String
  );
}

Future<PostDetails> fetchPost(
    Client client,
    int postId
) async {
  final response = await client.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts/$postId")
  );

  return compute(
    parsePost,
    response.body
  );
}

class PostDetailsPage extends StatelessWidget {
  const PostDetailsPage({
    required this.postId,
    super.key
  });
  final int postId;

  @override
  Widget build(
      BuildContext context
  ) {
    return FutureBuilder(
        future: fetchPost(Client(), postId),
        builder: (context, snapshot) {
            if (snapshot.hasData) {
                return Scaffold(
                    body: SingleChildScrollView(
                        child: WidthWrapper(
                            child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Text(
                                  snapshot.data!.description
                                )
                            )
                        )
                    )
                );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('An error has occurred!'),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
        }
    );
  }
}

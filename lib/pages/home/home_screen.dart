import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/entities/posts/post_details.dart';
import 'package:flutter_learning/shared/theme/theme.dart';

import '../../widgets/posts_list/posts_list.dart';

List<PostDetails> parsePosts(String responseBody) {
    final parsed = (jsonDecode(responseBody) as List)
        .cast<Map<String, dynamic>>();

    return parsed.map<PostDetails>(
       (json) => PostDetails.fromJson(
            json
       )
    ).toList();
}

Future<List<PostDetails>> fetchPosts(Client client) async {
    final response = await client.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts")
    );

    return compute(
        parsePosts,
        response.body
    );
}

class HomePage extends StatefulWidget {
    const HomePage({super.key});
    @override
    State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

    late Future<List<PostDetails>> postDetails;

    @override
    void initState() {
        // TODO: implement initState
        super.initState();

        postDetails = fetchPosts(
            Client()
        );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: ThemeColor.secondaryWhite,
            appBar: AppBar(),
            body: FutureBuilder<List<PostDetails>>(
                future: postDetails,
                builder: (context, snapshot) {
                    if (snapshot.hasData) {
                        return PostsList(
                            posts: snapshot.data!
                        );
                    } else {
                        return const Center(
                            child: CircularProgressIndicator(),
                        );
                    }
                }
            )
        );
    }
}
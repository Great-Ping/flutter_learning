import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fckupFlutter/features/widget.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:fckupFlutter/entities/posts/post_details.dart';
import 'package:fckupFlutter/shared/theme/theme.dart';

import '../../widgets/posts_list/posts_list.dart';

class HomePage extends StatefulWidget {
    const HomePage({super.key});
    @override
    State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

    @override
    void initState() {
        // TODO: implement initState
        super.initState();

    }

    @override
    Widget build(BuildContext context) {
        return StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection(
                "b"
            ).snapshots(),
            builder: (context, snapshot) {
                print("SAD: BUILD: ${snapshot.data?.docs.length}");
                if (snapshot.hasError) {
                    return const Center(
                        child: Text('An error has occurred!'),
                    );
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator(),
                    );
                }

                List<Widget> c = snapshot.data!.docs.map( (document) {
                    return PostCard(
                        post: PostDetails.fromJson(
                            document.data()! as Map<String, dynamic>
                        )
                    );
                }).toList();

                return WillPopScope(
                    onWillPop: () async {
                        await FirebaseAuth.instance.signOut();
                        print("logout");
                        return true;
                    },
                    child: Scaffold(
                        backgroundColor: Colors.brown,
                        appBar: AppBar(),
                        body: ListView(
                            children: c
                        )
                    )
                );
            }
        );
    }
}

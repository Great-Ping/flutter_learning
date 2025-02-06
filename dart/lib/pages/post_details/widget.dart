import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fckupFlutter/entities/posts/post_details.dart';
import 'package:fckupFlutter/shared/ui/width_wrapper/width_wrapper.dart';
import 'package:http/http.dart';



class PostDetailsPage extends StatelessWidget {
  const PostDetailsPage({
    required this.postId,
    required this.postDesc,
    super.key
  });
  final int postId;
  final String postDesc;

  void add() {

    FirebaseFirestore.instance.collection(
      "users"
    ).doc(
      FirebaseAuth.instance.currentUser?.uid
    ).update(
      {postId.toString(): 0}
    );
  }

  void remove() {
    FirebaseFirestore.instance.collection(
        "users"
    ).doc(
      FirebaseAuth.instance.currentUser?.uid
    ).update({postId.toString() : FieldValue.delete()});
  }

  @override
  Widget build(
      BuildContext context
  ) {
      Text text = const Text(
          "Add to favourites"
      );
      bool isAdded = false;
      return StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance.collection(
            "users"
          ).doc(
            FirebaseAuth.instance.currentUser?.uid
          ).snapshots(),
          builder: (context, snapshot) {

            if (snapshot.hasData) {
              Object? data = snapshot.data?.data();
              if (data != null && (data as Map<String,dynamic>).containsKey(
                  postId.toString()
              )) {
                isAdded = true;
                text = const Text(
                    "Remove favourites"
                );
              }
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Scaffold(
                backgroundColor: Colors.blueAccent,
                appBar: AppBar(),
                body: Center(
                  child: GestureDetector(
                      onTap: () {
                        if (isAdded) {
                          remove();
                          isAdded = false;
                          return;
                        }
                        add();
                        isAdded = true;
                      },
                      child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(20.0),
                              color: Colors.cyan,
                              child: text,
                            ),
                            Text(
                              postDesc
                            )
                          ],
                      )
                  )
                )
            );
          }
      );
  }
}

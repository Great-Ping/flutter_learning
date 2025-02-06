import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fckupFlutter/pages/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:fckupFlutter/entities/posts/post_details.dart';
import 'package:fckupFlutter/shared/theme/theme.dart';

import '../../widgets/posts_list/posts_list.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInPage extends StatefulWidget {
    const SignInPage({super.key});
    @override
    State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
    void onLogin(
        BuildContext context,
        String email,
        String password
    ) async {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email,
            password: password
        );

        FirebaseFirestore.instance.collection(
            "users"
        ).doc(
            FirebaseAuth.instance.currentUser?.uid
        ).set({});

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const HomePage()
            )
        );
    }

    @override
    void initState() {
        super.initState();

    }

    @override
    Widget build(BuildContext context) {

        String email = "";
        String password = "";

        return Scaffold(
            backgroundColor: Colors.amber,
            appBar: AppBar(),
            body: Column(
                children: [
                    TextField(
                        decoration: const InputDecoration(
                            labelText: "Email"
                        ),
                        onChanged: (text) {
                            email = text;
                        }
                    ),
                    TextField(
                        decoration: const InputDecoration(
                            labelText: "Password"
                        ),
                        onChanged: (text) {
                            password = text;
                        }
                    ),
                    GestureDetector(
                        onTap: () {
                            onLogin(
                                context,
                                email,
                                password
                            );
                        },
                        child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(20)
                                )
                            ),
                            child: const Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18.0,
                                    ),
                                    "Sign in"
                                ),
                            ),
                        )
                    )
                ],
            )
        );
    }
}
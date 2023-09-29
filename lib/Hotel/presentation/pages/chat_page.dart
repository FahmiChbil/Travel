import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mylasttravelapp/Hotel/presentation/pages/discusion_page.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc("7KkYygNNG8bn9GbQVjxrupu2LIJ3")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }

          return DiscusionPage(
              reciverUserName: "Help Manager",
              reciverUserId: snapshot.data!["uid"]);
        },
      ),
    );
  }

  Widget _buildListUserItem(DocumentSnapshot document, BuildContext context) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    if (_auth.currentUser!.email != data["email"]) {
      return ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DiscusionPage(
                    reciverUserName: data["email"], reciverUserId: data["uid"]),
              ));
        },
        title: Text(data["email"]),
      );
    } else {
      return Container();
    }
  }
}

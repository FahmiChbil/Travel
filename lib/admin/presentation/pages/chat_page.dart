import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mylasttravelapp/Hotel/presentation/pages/discusion_page.dart';
import 'package:mylasttravelapp/core/const/themes.dart';

class ChatPageAdmin extends StatelessWidget {
  ChatPageAdmin({super.key});
  static const id = "chat_route";

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backColor,
        elevation: 0,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("users").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("error");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }

          return ListView(
            children: snapshot.data!.docs
                .map((doc) => _buildListUserItem(doc, context))
                .toList(),
          );
        },
      ),
    );
  }

  Widget _buildListUserItem(DocumentSnapshot document, BuildContext context) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    if (_auth.currentUser!.email != data["email"]) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 5.w),
        child: ListTile(
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          tileColor: Colors.white,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DiscusionPage(
                      reciverUserName: data["email"],
                      reciverUserId: data["uid"]),
                ));
          },
          title: Text(data["email"]),
        ),
      );
    } else {
      return Container();
    }
  }
}

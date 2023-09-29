import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mylasttravelapp/Hotel/data/datasources/hotel_remote_datasource.dart';

class DiscusionPage extends StatelessWidget {
  final String reciverUserName;
  final String reciverUserId;
  final TextEditingController _messageController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  DiscusionPage(
      {super.key, required this.reciverUserName, required this.reciverUserId});

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await HotelRemoteDataSourceImpl()
          .sendMessage(reciverUserId, _messageController.text);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: HexColor("006a44"),
        title: Text(reciverUserName),
      ),
      body: Column(
        children: [
          Expanded(child: _buildMessageList()),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    return StreamBuilder(
      stream: HotelRemoteDataSourceImpl()
          .getMessage(reciverUserId, _firebaseAuth.currentUser!.uid),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("error ${snapshot.error}");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return ListView(
          shrinkWrap: true,
          children:
              snapshot.data!.docs.map((e) => _buildMessageItem(e)).toList(),
        );
      },
    );
  }

  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    var alignment = (data["senderId"] == _firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    Timestamp time = data["timestamp"];
    var houre = time.toDate().hour;
    var minute = time.toDate().minute;

    return Align(
      alignment: alignment,
      child: Row(
        mainAxisAlignment: data["senderId"] == _firebaseAuth.currentUser!.uid
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          Text("$houre:$minute"),
          Container(
            padding: EdgeInsets.all(5.h),
            margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
            constraints: BoxConstraints(maxWidth: 0.6.sw, minWidth: 0.1.sw),
            decoration: BoxDecoration(
                color: HexColor("006a44"),
                borderRadius: BorderRadius.circular(8)),
            child: Text(
              data["message"],
              style: TextStyle(fontSize: 15.sp),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 10.w),
      // color: HexColor("006a44").withOpacity(0.7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              cursorColor: Colors.black,
              cursorHeight: 17,
              controller: _messageController,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: "enter message"),
            ),
          ),
          IconButton(
              onPressed: sendMessage, icon: Image.asset('assets/send.png'))
        ],
      ),
    );
  }
}

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:mylasttravelapp/Hotel/data/models/all_hotels.dart';
import 'package:mylasttravelapp/Hotel/data/models/all_places.dart';
import 'package:mylasttravelapp/Hotel/data/models/message.dart';
import 'package:mylasttravelapp/Hotel/domain/entities/all_hotels.dart';
import 'package:http/http.dart' as http;
import 'package:mylasttravelapp/core/const/stripe_keys.dart';

abstract class HotelRemoteDataSource {
  Future<AllHotels> getHotels(String docid);
  Future<AllPlacesModel> getplaces();
  Future<Unit> payHotel(int amount, String type);
}

class HotelRemoteDataSourceImpl implements HotelRemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<List<String>> getdocsId() async {
    var collection = FirebaseFirestore.instance.collection('hotels2');

    var querySnapshot = await collection.get();
    var ids = querySnapshot.docs.map((e) => e.id).toList();
    // print(ids);
    return ids;
  }

  @override
  Future<AllHotels> getHotels(String docId) async {
    CollectionReference userRef = FirebaseFirestore.instance
        .collection('hotels2')
        .doc(docId)
        .collection('hotels');
    QuerySnapshot data = await userRef.get();
    List<QueryDocumentSnapshot> dataList = data.docs;
    var hotels = AllHotelsModel.fromJson(dataList);
    // print("=================");

    // print(hotels.allhotels.first.activities);
    return hotels;
  }

  @override
  Future<AllPlacesModel> getplaces() async {
    CollectionReference userRef =
        FirebaseFirestore.instance.collection('hotels2');
    QuerySnapshot data = await userRef.get();
    List<QueryDocumentSnapshot> dataList = data.docs;
    var places = AllPlacesModel.fromJson(dataList);
    // print("============");
    // print(hotels);

    return Future.value(places);
  }

  @override
  Future<Unit> payHotel(int amount, String type) async {
    String clientSecret =
        await _getClientSecret((amount * 100).toString(), type);

    await _initializePaymentSheet(clientSecret);
    var afterpay = await Stripe.instance.presentPaymentSheet();

    return Future.value(unit);
  }

  Future<void> _initializePaymentSheet(String clientSecret) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: "Basel",
      ),
    );
  }

  Future<String> _getClientSecret(String amount, String currency) async {
    var response = await http.post(
      Uri.parse('https://api.stripe.com/v1/payment_intents'),
      headers: {
        'Authorization': 'Bearer ${ApiKeys.secertkey}',
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      body: {
        'amount': amount,
        'currency': currency,
      },
    );

    var data = jsonDecode(response.body);

    return data['client_secret'].toString();
  }

  Future<void> sendMessage(String receiverId, String message) async {
    final String curentUserId = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();

    Message newMessage = Message(
        senderId: curentUserId,
        message: message,
        receiverId: receiverId,
        senderEmail: currentUserEmail,
        timestamp: timestamp);

    List<String> ids = [curentUserId, receiverId];
    ids.sort();
    String chatRoomId = ids.join("_");

    await _firestore
        .collection("chat_room")
        .doc(chatRoomId)
        .collection("messages")
        .add(newMessage.toMap());
  }

  Stream<QuerySnapshot> getMessage(String userId, String otherUserId) {
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");

    return _firestore
        .collection("chat_room")
        .doc(chatRoomId)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:wallet/main.dart';
import 'package:wallet/screens/home_screen/home_screen.dart';

//handle firebase services
class FirebaseApi {
  //instance of firebase messaging
  final _firebaseMessaging = FirebaseMessaging.instance;

  //fun to init notify\
  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();

    //fun to handle receive msg
    final fCMToken = await _firebaseMessaging.getToken();

    print('Token: $fCMToken');


    //further settings for push notification
    initPushNotifications();
  }

//fun to handle received messages
  void handleMessage(RemoteMessage? message) {
    if (message == null) return;

    //navigte to new screen
navigatorKey.currentState?.pushNamed('/signup',arguments: message);
  }

//fun to init foreground nd background
Future initPushNotifications() async {
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
}
}

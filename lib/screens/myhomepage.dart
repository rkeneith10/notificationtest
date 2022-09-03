import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../services/local_notification_service.dart';
import 'mysecondscreen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final LocalNotificationService service;

  @override
  void initState() {
    service = LocalNotificationService();
    service.initialize();
    // TODO: implement initState
    super.initState();
  }

  void displayToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.grey[500],
        textColor: Colors.white,
        fontSize: 18.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
              onPressed: () async {
                displayToast("Message");
                await service.showNotification(
                    id: 1, title: "title", body: "body");
              },
              child: const Text('Press')),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () async {
                displayToast("Message");
                await service.showScheduledNotification(
                    id: 0, title: "title", body: "body", seconds: 1);
              },
              child: const Text('Press Schedule')),
        ],
      )),
    );
  }
}

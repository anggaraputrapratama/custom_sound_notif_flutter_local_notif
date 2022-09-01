import 'package:custom_sound_notif_flutter_local_notif/notif_widget.dart';
import 'package:flutter/material.dart';

class LocalPushNotifications extends StatefulWidget {
  const LocalPushNotifications({Key? key}) : super(key: key);

  @override
  State<LocalPushNotifications> createState() => _LocalPushNotificationsState();
}

class _LocalPushNotificationsState extends State<LocalPushNotifications> {
  @override
  void initState() {
    super.initState();
    NotificationWidget.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 70),
            alignment: Alignment.topCenter,
            child: const Text(
              'Local Notification',
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 60, left: 20),
            alignment: Alignment.topLeft,
            child: Visibility(
                visible: false,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.menu),
                  color: Colors.blue[700],
                )),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      NotificationWidget.showNotification(
                          title: "Notif", body: "testing notif");
                    },
                    child: Container(
                      alignment: Alignment.topCenter,
                      margin: const EdgeInsets.only(top: 30, bottom: 30),
                      decoration: BoxDecoration(
                          color: Colors.blue.shade200,
                          borderRadius: BorderRadius.circular(10)),
                      height: 140,
                      width: 140,
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Send Notifications',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

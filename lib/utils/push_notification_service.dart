
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificatioService{

  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static initializedApp() async{
    String token = await messaging.getToken() ?? "x";
    print(token);

    FirebaseMessaging.onMessage.listen(_onMessage);
    FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);

  }

  static Future _onMessage(RemoteMessage message) async{
    print("Primero");
    print(message.data);
  }

  static Future _onBackgroundMessage(RemoteMessage message) async {
    print("Segundo");
  }




}

import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService{

  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static initializedApp() async{
    String token = await messaging.getToken() ?? "x";
    print(token);

    FirebaseMessaging.onMessage.listen(_onMessage);
    FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenedApp);

  }

  static Future _onMessage(RemoteMessage message) async{
    print(message.data);
    if(message.notification != null){
      print(message.notification!.title);
      print(message.notification!.body);
    }
  }

  static Future _onBackgroundMessage(RemoteMessage message) async {
    print("Segundo");
    print(message.data);
    if(message.notification != null){
      print(message.notification!.title);
      print(message.notification!.body);
    }
  }

  static Future _onMessageOpenedApp(RemoteMessage message) async{
    print("Aplicativo Cerrado");
    print(message.data);
    if(message.notification != null){
      print(message.notification!.title);
      print(message.notification!.body);
    }
  }




}
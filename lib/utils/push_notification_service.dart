
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificatioService{

  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static initializedApp() async{
    String token = await messaging.getToken() ?? "x";
    print(token);



  }




}
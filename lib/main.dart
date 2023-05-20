import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/login_screen.dart';
import 'colors.dart';
import 'responsive/responsive_layout.dart';
import 'responsive/mobile_screen_layout.dart';
import 'responsive/web_screen_layout.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb){
    <!--- await Firebase.initializeApp(
      options: const FirebaseOptions(apiKey:" AIzaSyDEkfDWW_HVq0rPERC0PoE1i2Ul3bk-nSA",
          appId: "1:381153026837:web:7b905dab7c5415ded23f1c",
          messagingSenderId: "381153026837",
          projectId: "instagram-clone-ac4c4",
        storageBucket: "instagram-clone-ac4c4.appspot.com"
      ),-->
    );
  }else
  {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      home:
      // const ResponsiveLayout(webScreenLayout: WebScreenLayout(), mobileScreenLayout: MobileScreenLayout()),
      const LoginScreen(),
    );
  }
}


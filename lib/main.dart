import 'package:abhisargah_health_app/screens/home/home.dart';
import 'package:abhisargah_health_app/screens/home/profile_screen.dart';
import 'package:abhisargah_health_app/services/authentication.dart';
import 'package:abhisargah_health_app/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User?>.value(
      value:Authentication().isAuthenticated,
      initialData: null,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primaryColor: Color(0xff90e0ef)),
        home: MyHomePage(),
        routes: {
          MyHomePage().route:(_)=>MyHomePage(),
          ProfileScreen().route:(_)=>ProfileScreen(),
        },
      ),
    );
  }
}

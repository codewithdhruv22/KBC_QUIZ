import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kbc/screen/home.dart';

import 'package:kbc/screen/login.dart';
import 'package:kbc/screen/quizintro.dart';

import 'package:kbc/services/localdb.dart';
import 'package:overlay_support/overlay_support.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}



class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);


  

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {




  bool isLogIn = false;

  getLoggedInState() async{
    await LocalDB.getUserID().then((value){
      setState((){
        isLogIn = value.toString() != "null" ;
      });
    });
  }



  @override
  void initState() {
    super.initState();
    getLoggedInState();
  }
  @override
  Widget build(BuildContext context) {
   return OverlaySupport.global (
      child: MaterialApp (
        title: 'Flutter Demo',
        theme: ThemeData(
        
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.purple,
        ),
        home:  isLogIn ? Home(): QuizIntro(),
      ),
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ishq/pages/all_matches.dart';
import 'package:ishq/pages/fillup.dart';
import 'package:ishq/pages/home.dart';
import 'package:ishq/pages/login.dart';
import 'package:ishq/pages/match_found.dart';
import 'package:ishq/pages/profile.dart';
import 'package:ishq/pages/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:transparent_image/transparent_image.dart';
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
   initialRoute: '/',
    routes: {
      '/':(context)=>Home(),
      '/match_found':(context)=>MatchFound(),
      '/all_matches':(context)=>AllMatches(),
      '/profile':(context)=>Profile(),
      '/signup':(context)=>Signup(),
      '/login':(context)=>Login(),
      '/fillup':(context)=>Fillup(),
    },

  ));
}
